---
layout: publication
title: "SONIC: Supersizing Motion Tracking for Natural Humanoid Whole-Body Control"
authors: "Zhengyi Luo*, Ye Yuan*, Tingwu Wang*, Chenran Li*, Fernando Castañeda*, Sirui Chen&Dagger;, Zi-Ang Cao&Dagger;, Jiefeng Li&Dagger;, David Minor&Dagger;, Qingwei Ben&Dagger;, Jinhyung Park&Dagger;, David Sami&Dagger;, Zi Wang&Dagger;, Xingye Da&Dagger;, Runyu Ding, Cyrus Hogg, Lina Song, Edy Lim, Eugene Jeong, Tairan He, Haoru Xue, Wenli Xiao, Simon Yuen, Jan Kautz, Yan Chang, Umar Iqbal, Linxi “Jim” Fan&dagger;, Yuke Zhu&dagger;"
pub_info_name: "Science Robotics"
pub_info_date: August 2026
note: "* Co-first authors. &Dagger; Core contributors. &dagger; Equal advising."
excerpt: "SONIC scales motion tracking to train one humanoid controller for VR teleoperation and autonomous whole-body manipulation."
images:
  thumb: luo-scirobot26-sonic.jpg
  main: luo-scirobot26-sonic.jpg
paper_link: "https://arxiv.org/abs/2511.07820"
journal_link: "https://doi.org/10.1126/scirobotics.aed4592"
webpage_link: "https://nvlabs.github.io/GEAR-SONIC/"
code_link: "https://github.com/NVlabs/GR00T-WholeBodyControl"
demo_link: "https://nvlabs.github.io/GEAR-SONIC/demo.html"
---
SONIC uses human motion tracking to train a single controller for whole-body humanoid movement. We studied how tracking performance changes as policies grow from 1.2 million to 42 million parameters. The study used more than 100 million frames from 700 hours of motion capture and 21,000 GPU hours of training. Increasing compute and the diversity of training motions improved tracking, and the learned controllers generalized to previously unseen motions.

A real-time kinematic planner generates reference motions for tasks such as navigation. A shared motion representation also lets the same policy follow a VR operator or take commands from a vision-language-action model. On a physical humanoid, this interface enables autonomous manipulation that requires the robot to coordinate where it places its hands and feet.

Published in [*Science Robotics*, vol. 11, issue 117, article eaed4592]({{ page.journal_link }}).
