---
layout: publication
title: "ScheduleGen: Demonstration Generation via Skill Scheduling for Multi-Arm Imitation Learning"
authors: "Neel Jawale, Stephan Pleines, Soha Pouya, Yuke Zhu, Ajay Mandlekar&dagger;, Caelan Garrett&dagger;"
pub_info_name: "Technical report arXiv:2610.39429"
pub_info_date: October 2026
note: "&dagger; Equal advising."
excerpt: "ScheduleGen combines planning and skill scheduling to synthesize coordinated multi-arm demonstrations from a small set of examples while accounting for collisions and cross-arm constraints."
images:
  thumb: jawale-arxiv26-schedulegen.png
  main: jawale-arxiv26-schedulegen.png
paper_link: "https://arxiv.org/abs/2610.39429"
webpage_link: "https://njawale42.github.io/ScheduleGen/"
---
Two robot arms can often work in parallel, but one arm may need to wait for the other to finish a movement or clear a shared workspace. ScheduleGen adapts a small set of demonstrations to new scenes and schedules the motions of the arms together. It generated successful demonstrations at an average rate of 79.6% across 28 simulated task variants. Policies trained on generated data achieved 50–80% success across eight physical variants.
