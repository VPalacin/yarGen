# This file has been added due to naiveBayesClassifier bug, only triggered with python3
# The file should be placed within the same path as the main program
# More information available on the following link: https://github.com/muatik/naive-bayes-classifier/issues/11

class NotSeen(Exception):
    """
    Exception for tokens which are not indexed 
    because never seen in the trainin data
    """
    def __init__(self, value):
        self.value = value
    
    def __str__(self):
        return "Token '{}' is never seen in the training set.".format(self.value)
