# -*- coding: utf-8 -*-
"""
Created on Mon Jul 25 09:09:35 2016

OpenAI Documentation test

@author: sylhare
@site: https://gym.openai.com/docs
"""

###Running an environment
""""
Here's a bare minimum example of getting something running. 
This will run an instance of the CartPole-v0 environment for 1000 timesteps, 
rendering the environment at each step.
You should see a window pop up rendering the classic cart-pole problem.

Need Pyglet 
"""
import gym
from gym import spaces
from gym import envs

#print(envs.registry.all()) #This will give you a list of EnvSpec

#env = gym.make('CartPole-v0') #requires pyglet to render
#env = gym.make('Pendulum-v0')
#env = gym.make('Acrobot-v0')
#env = gym.make('Copy-v0')
#env = gym.make('RepeatCopy-v0')
#env = gym.make('DuplicatedInput-v0')
#env = gym.make('ReversedAddition-v0')
#env = gym.make('Reverse-v0')
env = gym.make('MountainCar-v0')
#env = gym.make('MsPacman-v0') #Requires atari-py
#env = gym.make('Hopper-v1') #Requires MuJoCo-py


def demoSpace():
    """
    The Discrete space allows a fixed range of non-negative numbers,
    so in this case valid actions are either 0 or 1
    """
    print(env.action_space)
    """
    The Box space represents an n-dimensional box, 
    so valid observations will be an array of 4 numbers
    """
    print(env.observation_space)
    
    "We can also check the Box's bounds:"
    print(env.observation_space.high)
    print(env.observation_space.low)
    
    """
    This introspection can be helpful to write generic code that works for many different environments.
    Box and Discrete are the most common Spaces. 
    You can sample from a Space or check that something belongs to it: 
    """
    space = spaces.Discrete(8) # Set with 8 elements {0, 1, 2, ..., 7}
    x = space.sample()
    assert space.contains(x)
    assert space.n == 8


def quickDemo(env):   
    env.reset()
    for _ in range(1000):
        env.render()
        env.step(env.action_space.sample()) # take a random action
        
def demo(env):
    #env.monitor.start('/tmp/cartpole-experiment-1') #Need ffmpeg and avonv to record results
    for i_episode in range(20):
        observation = env.reset()
        for t in range(1000):
            env.render()
            print(observation)
            action = env.action_space.sample()
            observation, reward, done, info = env.step(action)
            if done:
                print("Episode finished after {} timesteps".format(t+1))
                break
    env.monitor.close()

"""
Upload the file in the training directory in the Gym repository
@writeup to attach your gist
"""
def upload():
    gym.upload('/tmp/trainingDirectory', writeup='https://gist.github.com/gdb/yourgist', api_key='YOUR_API_KEY')

    
quickDemo(env)          
#demo(env)
#upload()