#!/bin/bash
# run-daily.sh — launchd entry point for the daily research agent.
# Invokes BlueCode headlessly with the research-daily agent.
# Logs to runs/launchd-stdout.log and runs/launchd-stderr.log.

set -u

REPO_DIR="$HOME/dev/notes-gallery"
LOG_DIR="$REPO_DIR/runs"
STDOUT_LOG="$LOG_DIR/launchd-stdout.log"
STDERR_LOG="$LOG_DIR/launchd-stderr.log"
BLUECODE_BIN="$HOME/.bluecode/bin/bluecode"
AGENT="research-daily"
MODEL="bluecode-ai/GLM-5.2"

mkdir -p "$LOG_DIR"

# Pre-flight: ensure repo exists and is clean-ish
if [ ! -d "$REPO_DIR/.git" ]; then
  echo "$(date -Iseconds) FATAL: repo $REPO_DIR does not exist" >> "$STDERR_LOG"
  exit 1
fi

# Pull latest (in case config was edited remotely or a prior run pushed).
# Remote uses SSH host alias "github-agent" (~/.ssh/config) which pins the
# correct SSH key (id_ed25519_github) for the agent-research-gallery repo.
cd "$REPO_DIR" || exit 1
git pull --rebase --quiet 2>>"$STDERR_LOG"

# Ensure SSH agent has the key (launchd sessions don't inherit the user's agent).
if [ -z "${SSH_AUTH_SOCK:-}" ]; then
  eval "$(ssh-agent -s)" 2>>"$STDERR_LOG"
  ssh-add "$HOME/.ssh/id_ed25519_github" 2>>"$STDERR_LOG"
fi

# Run the agent headlessly.
# --format json emits raw events (machine-parseable for the log)
# The message instructs the agent to execute the research-daily skill for today.
"$BLUECODE_BIN" run \
  --dir "$REPO_DIR" \
  --agent "$AGENT" \
  --model "$MODEL" \
  --format json \
  "Execute the research-daily skill for today's daily research run. Read research-directions.yaml and follow the 7-phase protocol. Run headlessly — do not pause for confirmation. Commit and push when done." \
  >>"$STDOUT_LOG" 2>>"$STDERR_LOG"

EXIT_CODE=$?
echo "$(date -Iseconds) run-daily.sh exited with code $EXIT_CODE" >> "$STDERR_LOG"
exit $EXIT_CODE
