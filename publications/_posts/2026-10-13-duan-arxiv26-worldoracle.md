---
layout: publication
title: "WorldOracle: Benchmarking Action-Conditioned World Models against Real-World Executions"
authors: "Haoyi Duan, Liliang Chen, Nan Wang, Yang Zhang, Yuhang Lu, Xiaotong Chen, Wei-Cheng Tseng, Shenyuan Gao, Zhaoshuo Li, Jingyi Jin, Pooya Jannaty, Dhruv Shah, Yuke Zhu, Ming-Yu Liu, Maoqing Yao, Guanghui Ren"
pub_info_name: "Technical report arXiv:2610.18826"
pub_info_date: October 2026
excerpt: "WorldOracle compares action-conditioned video predictions with paired physical executions, evaluating physical outcomes, spatial alignment, interaction details, and consistency across camera views."
images:
  thumb: duan-arxiv26-worldoracle.png
  main: duan-arxiv26-worldoracle.png
paper_link: "https://arxiv.org/abs/2610.18826"
webpage_link: "https://worldoracle-benchmark.github.io/"
code_link: "https://github.com/WorldOracle-benchmark/WorldOracle/"
---
WorldOracle gives a model the starting observation and action sequence from a real robot trial, then compares its predicted video with the recording. The evaluation checks where contact happens, how objects change state, and whether the same interaction looks consistent across cameras. The recorded trials include successes and failures from human teleoperation and robot policies.

*Figure 1 from [the paper](https://arxiv.org/html/2610.18826v5), by Haoyi Duan and coauthors.*
