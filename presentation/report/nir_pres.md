---
## Front matter
lang: ru-RU
title: Research work
subtitle: Named Entity Recognition (NER)
author:
  - Artamonov Timofey Evgenievich
institute:
  - Peoples' Friendship University of Russia, Moscow, Russia
date: June 2, 2024

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Artamonov Timofey Evgenievich
  * student of NKNbd-01-21
  * Peoples' Friendship University of Russia
  * <https://github.com/teartamonov>

:::
::: {.column width="30%"}

![](image/ava.jpg)

:::
::::::::::::::

# Introduction

## The purpose of the work

Learn how to use models for NER, train them, fine-tune them, and preprocess data for them.

## Tasks

- Research the NER task
- Explore data preprocessing methods
- Explore the methods of training your own model
- Explore methods of training model using the transformers library
- Explore methods to fine-tune your model
- Learn to use fine-tuned models

## Motivation

Text analysis is quite a labor-intensive task, especially nowadays when it can involve entire databases with hundreds of thousands of lines of text. 
Extracting information from such text can take a considerable amount of time and effort from individuals involved in the task. 
Yet, the task of extracting information from text and analyzing it is becoming increasingly important for decision-making in various fields, including business and equally important areas like medicine.
To tackle such tasks, Natural Language Processing (NLP) technologies are employed. One of the key tasks in NLP is Named Entity Recognition (NER). 

## Goals of the Research work

Named Entity Recognition is the task of identifying and classifying named entities from text. The main entities include people’s names, geographical and political locations, and organizations. This approach allows for the automatic extraction of important information from unstructured text, which can then be used for various purposes, such as database creation or automation of various text-related processes.
Neural networks are the primary tool for solving the named entity recognition task. These networks are pre-trained on large volumes of data and are capable of accurately predicting the correct entity tag.
The goal of this work is to learn how to utilize such models, train and fine-tune pre-trained models, and also explore text vectorization methods.
This research work will be useful for people new in Maching Learning and NLP tasks and interested in it.

# Methods a to solve NER task

## Data preprocessing 

In any NLP task, as the name suggests, we are dealing with text. Let's look at the most obvious and common example of a neural network - Chat-GPT. 
This neural network, as input data, receives a text message from the user and, as output data, produces a response in the form of a text message. 
It may seem that the neural network understands our language and can even use it. In fact, all neural networks, regardless of their field of work: calculations, text, images, they all work only with numbers.
How does this happen? The data with which the neural network works is subject to extensive preprocessing.

## Example of how words are turning into vectors (рис. [-@fig:001])

![word2vec function example](image/6.PNG){ #fig:001 width=70% }

## Padding and Truncation

It is also necessary to ensure that all sentences are the same length, because the model will work with tensors. 
To do this, the truncation() function is used, which truncates all sentences if they are longer than a certain limit, and the padding() function, which increases the size of a sentence to a certain one if its length is below, adding neutral elements.
But this is not the end of text preprocessing. Essentially, the NER problem is a multi-class classification problem, where we must assign each word its own class. 
The final list of classes depends on the specific task, but the most common classes or entities are PER(Person), ORG(Organization), LOC(Location), O(not entity). 
So if we have sentence of length 6 and our maximum is 7 our sentence will look like ['Bill', 'Gates', 'is', 'founder', 'of', 'Microsoft', 'O']

## One-hot encoding

We have a set in which each value is divided into 2 parts: the first part is a text sentence (tokens), the second part is a list that defines the class of each word in the sentence (labels).
Due to the peculiarities of the functions used in neural networks, it is also necessary to transform the values of labels - the very values that determine the class of a word. 
Typically, in datasets, the labels column is presented as a list with class labels in string format, or in the format of indexes indicating this class. (рис. [-@fig:002])

![word2vec function example](image/7.PNG){ #fig:002 width=50% }

In any case, we need to make sure that each word has a corresponding list of zeros and ones at the index that defines that class. This conversion method is called one-hot encoding.
For example, for word "Bill" we will have tag [1, 0, 0, 0] meaning it's a PER(person).


## Training own model

If we want to train our own model from scratch, then we need to decide on its architecture ourselves. 
For each task, you need to apply a specific architecture and a specific approach. Some layers work better at solving one problem and worse at solving another, but this does not mean that everything has been determined for a long time. 
Training a neural network is still a creative process; for each network with its data set, you need to find your own approach, experimenting with different coefficients, layers, loss functions, etc.
But still, one way or another, neural networks of the same complexity for the same task will look similar. 

## Example architecture of my own module (рис. [-@fig:003])

![Sequantial Bi-LSTM model](image/1.PNG){ #fig:003 width=70% }

## The need to use LSTM

Since we process each word in the list sequentially, and traditional neural networks do not have the property of memory, so each step they forget the previous one. 
Because of this, it will be problematic to take into account the context of the sentence, even despite vectorization. 
RNN or Recurrent Neural Network can help with this - these are networks that have feedback and allow you to store information, this is a kind of memory. 
We will use Long Short-Term Memory or LSTM - modifications of the RNN network. 

## Some necceseary functions

- The last layer is a layer with the number of neurons equal to the number of classes
- Softmax activation function in the last layer
- Categorical cross-entropy loss function
   
The rest is left to the discretion of the developer; often, to prevent overtraining, a Dropout layer is used, which disables a certain percentage of neurons every epoch. 
Also, to prevent overfitting, because this is the biggest problem in machine learning, it is better to use a tool such as callback, which, if the model’s performance consistently decreases during training, will automatically stop the model’s training. 
Everything else, namely: the number of epochs, the initial learning coefficient, the optimizer and the batch size - this is what you need to experiment with and select yourself. The model can then be compiled and trained on your data.

## Example of training my own model (рис. [-@fig:004])

![Loss function changing with number of epochs](image/2.PNG){ #fig:004 width=70% }

## Example of training my own model (рис. [-@fig:005])

![Metrics changing with number of epochs](image/3.PNG){ #fig:005 width=70% }

## Using transformers library

All of the above has already been implemented in such large libraries as tensorflow and pytorch, but there is also the transformers library, which appeared not so long ago. 
Using it, you can use already pretrained models that were previously trained on a large amount of data and retrain it on a specific task or you can even use fine-tuned models from well-known companies that are publicly available and have excellent performance.

## Fine-tuning of pretrained model

The most popular and used models for working with text are BERT and GPT, since we are dealing with the task of multi-class classification, we will use the bert-base model, since BERT copes better with such tasks. 
The choice of a specific bert-base-cased model depends on the specific task and user. A fine-tune pretrained model requires much less effort compared to training your own model. 
So all you need is:
- Preprocess Data (better use AutoTokenizer)
- Load model
- Compile model
- Fit model on your preprocessed data

## Example of fine-tuning model (рис. [-@fig:006])

![distilBERT-base-uncased model loss](image/4.PNG){ #fig:006 width=70% }

## Example of fine-tuning model (рис. [-@fig:007])

![distilBERT-base-uncased model metrics](image/5.PNG){ #fig:007 width=70% }

### Using fine-tuned model

Also using pipeline() you can use a ready-made trained model for the task you need. The easiest method is to use the Hugging Face website, where you can find a model in the chosen language that will solve the chosen problem. 
You must specify in the parameters of the pipeline() function the name of the model you want to use and the problem that this model will solve. 
Or you can separately import the tokenizer of this model using the from_pretrained() method, also specifying the name of the model in the parameters, then using the same method you need to set the model itself.

# Conclusion

The work examined one of the tasks of Natural Language Proccessing, namely Named Entity Recognition, which is one of the most relevant in our time. Methods for solving this problem were also considered using various tools, in particular data preprocessing, model training, additional training of the model, and the use of ready-made models
As said, this researck work will be useful for people new to Maching Learning, people who interested in NLP tasks ecpessialy NER task. For more deep and concrete knowledges check official documentation such as TensorFlow and PyTorch.
