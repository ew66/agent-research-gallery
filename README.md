# notes-gallery

A gallery of research notes, daily digests, and reports.

Automated daily by the `research-daily` agent (launchd 07:00). See `research-directions.yaml` for configured topics and `runs/` for run logs.

## Structure

- `digests/` — daily research digests (link out to deep-dive reports)
- `reports/` — deep-dive teaching reports (paper research & analyses)
- `runs/` — daily run logs (audit trail + dedup source)

## Daily Digests

- [Daily Digest — 2026-09-08](https://ew66.github.io/notes-gallery/digests/20260908_digest.html) — 4 方向 55 篇新論文 + 3 篇深度報告（Scale-QLoRA / SeamFlow / PriorEdit3D）；arXiv RSS 驗證 (2026-09-08)
- [Daily Digest — 2026-09-07](https://ew66.github.io/notes-gallery/digests/20260907_digest.html) — 4 方向 30 篇新論文 + 3 篇深度報告（DSAQuant / Minima NVFP4 / PixelIR）(2026-09-07)

## Reports

### Featured

- [Scale-QLoRA: Code-Invariant Adapter Merging for Native 4-bit Microscaling LLMs](https://ew66.github.io/notes-gallery/reports/20260908_ScaleQLoRA_NVFP4_Adapter_Merging.html) — 凍結 E2M1 代碼平面、僅調適尺度場，使 NVFP4/MXFP4 下 LoRA 合併為位元精確恆等；3.9× 訓練加速、~125× 任務切換 (2026-09-08)
- [SeamFlow: Structure-Aware Flow Matching for UV Unwrapping](https://ew66.github.io/notes-gallery/reports/20260908_SeamFlow_Flow_Matching_UV_Unwrap.html) — 將離散網格切割重構為邊概率空間的連續流匹配，高斯先驗→接縫分佈；消除投影誤差與順序偏差 (2026-09-08)
- [PriorEdit3D: Learning 3D Editing without Paired Supervision via Generative Prior Distillation](https://ew66.github.io/notes-gallery/reports/20260908_PriorEdit3D_3D_Editing_GenPriorDistill.html) — 蒸餾圖像編輯器+VLM+圖生3D 教師先驗，前饋式指令 3D 編輯；3D 感知分佈匹配正則化防幾何塌陷 (2026-09-08)
- [DSAQuant: Denoising-Stage-Aligned QAT for Video Generation](https://ew66.github.io/notes-gallery/reports/20260907_DSAQuant_Video_Diffusion_QAT.html) — 階段化去噪先驗注入 QAT，W3A3 下 VBench +6.60；末步停用 CFG 防高頻偽影 (2026-09-07)
- [Minima NVFP4: Why Gated DeltaNet Survives 4-Bit Quantization](https://ew66.github.io/notes-gallery/reports/20260907_Minima_NVFP4_GatedDeltaNet_W4A4.html) — 挑戰「遞迴層怕量化」直覺，全 496 線性層 W4A4 匹配 BF16，17.5 GiB 最小最快 (2026-09-07)
- [PixelIR: Pixel-Space Image-Residual Flow Matching for One-Step SR](https://ew66.github.io/notes-gallery/reports/20260907_PixelIR_Flow_Matching_OneStep_SR.html) — 圖像流+殘差流解耦 fidelity/perception，32.9M 參數、8.5ms 延遲達 SOTA (2026-09-07)
- [Diffusion Guidance Research — SSG vs C²FG](https://ew66.github.io/notes-gallery/reports/Diffusion_Guidance_Research_SSG_C2FG.html) — 擴散模型引導機制：Token Swapping 與 Score Discrepancy (2026-06-26)
- [TAD-SR: Time-Aware One Step Diffusion SR](https://ew66.github.io/notes-gallery/reports/20260629_TAD_SR_Super_Resolution.html) — 時間感知一步擴散超解析度，含代碼一致性驗證 (2026-06-29)
- [TADSR (CVPR 2026): Time-Aware One Step Diffusion Network](https://ew66.github.io/notes-gallery/reports/20260629_TADSR_CVPR2026_Time_Aware_Diffusion_SR.html) — SD 各時間步生成先驗挖掘 + 可控 fidelity/realism 權衡 (2026-06-29)
- [Diffusion PTQ Research — APQ-DM vs SegQuant](https://ew66.github.io/notes-gallery/reports/20260719_Diffusion_PTQ_APQDM_SegQuant.html) — 擴散模型後訓練量化：時間步分組感知 vs 語意分割+極性保留 (2026-07-19)
- [Diffusion PTQ Survey — Top 3 Papers (2023-2026)](https://ew66.github.io/notes-gallery/reports/20260719_Diffusion_PTQ_Survey_Top3.html) — 12 篇 PTQ 代表作問題全景 + TOP 3 評選（SegQuant/SVDQuant/Q-VDiT）(2026-07-19)
- [Generative Modeling via Drifting](https://ew66.github.io/notes-gallery/reports/20260828_Drifting_Models.html) — 訓練期演化 pushforward 分佈，anti-symmetric drifting field 實現原生 1-NFE 生成，ImageNet 256 FID 1.54 (2026-08-28)

### Diffusion PTQ Individual Paper Reports (2023-2026)

- [SVDQuant](https://ew66.github.io/notes-gallery/reports/20260719_SVDQuant_W4A4_Diffusion.html) — 低秩分支吸收 outliers 的 4-bit 擴散模型量化，ICLR 2025 Spotlight (2026-07-19)
- [Q-VDiT](https://ew66.github.io/notes-gallery/reports/20260719_QVDiT_Video_DiT_KVCache.html) — 視頻生成擴散 Transformer 的量化與蒸餾，ICML 2025 (2026-07-19)
- [ViDiT-Q](https://ew66.github.io/notes-gallery/reports/20260719_ViDiTQ_Video_Diffusion.html) — 圖像與視頻生成擴散 Transformer 的高效量化，ICLR 2025 (2026-07-19)
- [PTQ4DiT](https://ew66.github.io/notes-gallery/reports/20260719_PTQ4DiT_Diffusion_Transformer.html) — 擴散 Transformer 之訓練後量化研究 (2026-07-19)
- [Q-Diffusion](https://ew66.github.io/notes-gallery/reports/20260719_QDiffusion_ICCV2023.html) — 擴散模型量化研究，ICCV 2023 (2026-07-19)
- [PTQD](https://ew66.github.io/notes-gallery/reports/20260719_PTQD_NeurIPS2023.html) — 噪聲預測誤差引導之擴散模型量化研究，NeurIPS 2023 (2026-07-19)
- [TFMQ-DM](https://ew66.github.io/notes-gallery/reports/20260719_TFMQDM_CVPR2024.html) — 時間特徵維持量化，CVPR 2024 (2026-07-19)
- [DMQ](https://ew66.github.io/notes-gallery/reports/20260719_DMQ_Outlier_Diffusion.html) — 離群值分析之擴散模型後訓練量化 (2026-07-19)
- [EfficientDM](https://ew66.github.io/notes-gallery/reports/20260719_EfficientDM_ICLR2024.html) — 輕量化 QAT 達成 W4A4 無損，ICLR 2024 (2026-07-19)
