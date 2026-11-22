---
layout: publication
title: "Contrastive Action-Image Pre-training for Visuomotor Control"
authors: "Yuvan Sharma*, Dantong Niu*&Dagger;, Anirudh Pai*, Zekai Wang, Zhuoyang Liu, Baifeng Shi, Stefano Saravalle, Boning Shao, Ruijie Zheng, Jing Wang, Konstantinos Kallidromitis, Yusuke Kato, Fabio Galasso, Yuke Zhu, Danfei Xu, Linxi “Jim” Fan, Jitendra Malik&dagger;, Trevor Darrell&dagger;, Roei Herzig&dagger;"
pub_info_name: "Technical report arXiv:2606.17256"
pub_info_date: June 2026
note: "* Equal contribution. &Dagger; Project lead. &dagger; Equal advising."
excerpt: "CAIP trains a visual encoder to match first-person images with 3D hand movements, then uses those visual features to guide robot manipulation."
images:
  thumb: sharma-arxiv26-caip.png
  main: sharma-arxiv26-caip.png
paper_link: "https://arxiv.org/abs/2606.17256"
webpage_link: "https://caip-encoder.github.io/"
code_link: "https://github.com/yuvansharma/caip_encoder"
---
CAIP uses the motion of a person’s hands as a proxy for how a robot gripper might move. During pre-training, the encoder learns to match an image with the corresponding sequence of 3D hand movements. The authors combined 32,041 hours of first-person human video with 88 hours of robot data and evaluated the resulting encoder on a physical robot performing tasks such as folding and pouring.

*Figure 1 from [the paper](https://arxiv.org/html/2606.17256v1), by Yuvan Sharma and coauthors.*
