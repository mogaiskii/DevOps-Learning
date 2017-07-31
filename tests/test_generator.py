import unittest
from buzz import generator

def test_sample_single_word():
    line = ('foo','bar','foobar','barfoo')
    word = generator.sample(line,1)
    assert word in line

def test_sample_multiple_words():
    line = ('foo','bar','foobar','barfoo')
    words = generator.sample(line,2)
    assert len(words)==2
    assert all(word in line for word in words)
    assert words[0] != words[1]

def test_generate_buzz_of_at_least_five_words():
    phrase = generator.generate_buzz()
    assert len(phrase) >= 5
