#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Mon Aug  1 15:23:40 2016

@author: sylhare
"""

from gym import envs
envids = [spec.id for spec in envs.registry.all()]
for envid in sorted(envids):
    print(envid)