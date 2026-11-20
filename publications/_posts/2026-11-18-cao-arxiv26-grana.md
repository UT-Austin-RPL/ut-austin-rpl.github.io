---
layout: publication
title: "Grana: Compositional Reward Modeling for Long-Horizon Robot Manipulation"
authors: "Zi-ang Cao*, Kaiyuan Zheng*, Yinzhen Xu, Haonan Duan, Jiasheng Gu, Fengyuan Hu, Nan Zhu, Kun Lei, Kevin Lin, Ruijie Zheng, Shenyuan Gao, Fangqi Zhu, Zhe Zhang, Radha Poovendran, Linxi “Jim” Fan&dagger;, Guanzhi Wang&dagger;, Yuke Zhu&dagger;"
pub_info_name: "Technical report arXiv:2611.24926"
pub_info_date: November 2026
note: "* Equal contribution. &dagger; Equal advising."
excerpt: "Grana estimates progress within each manipulation subtask to track both completed steps and setbacks during long-horizon robot tasks."
images:
  thumb: cao-arxiv26-grana-thumb.webp
  main: cao-arxiv26-grana.jpg
paper_link: "https://arxiv.org/abs/2611.24926"
webpage_link: "https://research.nvidia.com/labs/gear/grana/"
code_link: "https://github.com/NVlabs/Grana"
video_link: "https://research.nvidia.com/labs/gear/grana/assets/video/grana-film-long-avc.mp4"
---
Grana is a vision-language reward model that measures progress on multi-step robot manipulation tasks. Given a sequence of subtask descriptions, it identifies the unfinished step, estimates progress within that step, and combines the estimate with credit for completed steps. If a robot loses its grip during an insertion, the estimated progress can fall while earlier assembly steps still count.

We convert sparse subtask boundaries and annotations of action quality into dense progress targets. Pretraining on 200 mostly short manipulation tasks supports reward prediction on unseen tasks and improves adaptation to five long-horizon tasks. On real robots, the same progress estimates guide policy training through reinforcement learning and action selection through model predictive control.

<p class="pub-note">{{ page.note }}</p>
