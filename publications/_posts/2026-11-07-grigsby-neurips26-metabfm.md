---
layout: publication
title: "Meta-Reinforcement Learning with Zero-Shot Reinforcement Learning"
authors: "Jake Grigsby, Siddhant Agarwal&dagger;, Yu Lei&dagger;, Leonidas Varveropoulos&dagger;, Yuke Zhu"
pub_info_name: "Conference on Neural Information Processing Systems (NeurIPS)"
pub_info_date: "2026"
note: "&dagger; Equal contribution."
excerpt: "MetaBFM combines supervised meta-reinforcement learning with reward-free behavior learning, enabling agents to adapt online to new environments and objectives beyond their training rewards."
images:
  thumb: grigsby-neurips26-metabfm-thumb.png
  main: grigsby-neurips26-metabfm.png
paper_link: "https://arxiv.org/pdf/2611.10553"
code_link: "https://github.com/UT-Austin-RPL/metabfm"
---
When an agent encounters a new task, it may need to learn both how a new environment works and which behavior earns a reward. MetaBFM trains on a mixture of experience with and without reward labels. At test time it can explore, use a strategy it has learned, or infer an objective from the rewards it observes. In experiments it matched supervised meta-reinforcement learning on familiar reward functions and adapted to objectives omitted from training.
