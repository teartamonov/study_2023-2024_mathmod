---
## Front matter
title: "Research work"
subtitle: "Named Entity Recognition (NER)"
author: "Artamonov Timofey Evgenievich"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---


# Introduction

## Motivation and goals of the work

Text analysis is quite a labor-intensive task, especially nowadays when it can involve entire databases with hundreds of thousands of lines of text. 
Extracting information from such text can take a considerable amount of time and effort from individuals involved in the task. 
Yet, the task of extracting information from text and analyzing it is becoming increasingly important for decision-making in various fields, including business and equally important areas like medicine.
To tackle such tasks, Natural Language Processing (NLP) technologies are employed. One of the key tasks in NLP is Named Entity Recognition (NER). 
Named Entity Recognition is the task of identifying and classifying named entities from text. The main entities include people’s names, geographical and political locations, and organizations. This approach allows for the automatic extraction of important information from unstructured text, which can then be used for various purposes, such as database creation or automation of various text-related processes.
Neural networks are the primary tool for solving the named entity recognition task. These networks are pre-trained on large volumes of data and are capable of accurately predicting the correct entity tag.
The goal of this work is to learn how to utilize such models, train and fine-tune pre-trained models, and also explore text vectorization methods.

# Methods and steps to solve NER task

## Data preprocessing 

In any NLP task, as the name suggests, we are dealing with text. Let's look at the most obvious and common example of a neural network - Chat-GPT. 
This neural network, as input data, receives a text message from the user and, as output data, produces a response in the form of a text message. 
It may seem that the neural network understands our language and can even use it. In fact, all neural networks, regardless of their field of work: calculations, text, images, they all work only with numbers.
How does this happen? The data with which the neural network works, first of all, we will talk about training, is subject to extensive preprocessing. In our case, we are working with text. It's not as simple as with images. 
If in the case of images we can simply represent each pixel as an array that determines its color, then in the case of text it will not be possible to simply assign an index to each word, because our speech is not so simple. 
It is impossible to consider words separately from each other - in the form of indices, because each sentence is a grammatically organized combination of words that has semantic and intonation completeness. 
Let's say, in the case of our NER task, we can omit the intonation, because It doesn’t matter to us what tone the sentence is, but we cannot determine the semantic component, which is formed precisely from the fact that all the words in the sentence are connected with another. 
The solution to this problem, of course, has already been found. To do this, we first need to translate all the words into indexes; they are often indexed depending on the frequency of their use in a certain dataset. 
Afterwards, these indices are translated into multidimensional vectors, which implement the semantic component. As a result, from the list of words, we already get a list of vectors of real numbers that our neural network can already work with. 
It is also necessary to ensure that all sentences are the same length, because the model will work with tensors. 
To do this, the truncation() function is used, which truncates all sentences if they are longer than a certain limit, and the padding() function, which increases the size of a sentence to a certain one if its length is below, adding neutral elements.
But this is not the end of text preprocessing. Essentially, the NER problem is a multi-class classification problem, where we must assign each word its own class. 
The final list of classes depends on the specific task, but the most common classes or entities are PER(Person), ORG(Organization), LOC(Location), O(not entity). 
Let's quickly talk about how a model is trained to solve a multi-class classification problem. 
We have a set in which each value is divided into 2 parts: the first part is a text sentence (tokens), the second part is a list that defines the class of each word in the sentence (labels).
Due to the peculiarities of the functions used in neural networks, it is also necessary to transform the values of labels - the very values that determine the class of a word. Typically, in datasets, the labels column is presented as a list with class labels in string format, or in the format of indexes indicating this class. 
In any case, we need to make sure that each word has a corresponding list of zeros and ones at the index that defines that class. This conversion method is called one-hot encoding.
Once we've converted our text data into numerical vectors and applied one-hot encoding to our labels, we're finally ready to start training the model.


## Training own model

If we want to train our own model from scratch, then we need to decide on its architecture ourselves. 
For each task, you need to apply a specific architecture and a specific approach. Some layers work better at solving one problem and worse at solving another, but this does not mean that everything has been determined for a long time. 
Training a neural network is still a creative process; for each network with its data set, you need to find your own approach, experimenting with different coefficients, layers, loss functions, etc.
But still, one way or another, neural networks of the same complexity for the same task will look similar. 
Let's move on to the practical part. Considering that we are working with text data, we need to process the entire sentence as a whole, and not each word separately. 
Since we process each word in the list sequentially, and traditional neural networks do not have the property of memory, that is, each step they forget the previous one. 
Because of this, it will be problematic to take into account the context of the sentence, even despite vectorization. 
RNN or Recurrent Neural Network can help with this - these are networks that have feedback and allow you to store information, this is a kind of memory. 
We will use Long Short-Term Memory or LSTM - modifications of the RNN network. LSTM-based networks have achieved success in many tasks such as classification, image recognition, etc., outperforming their standard versions. 
To be more precise, we will use BiLSTM or Bidirectional LSTM to find bidirectional long-term dependencies. 
The last layer must be a layer with the number of neurons equal to the number of classes and the softmax activation function, this is a multivariable logistic function - this is a generalization of the logistic function for the multidimensional case. 
The function transforms the final vector into a vector of the same dimension, where each coordinate of the resulting vector is represented by a real number in the interval [0,1] and the sum of the coordinates is equal to 1. 
For the task of multi-class classification, it is also most effective to use the categorical cross-entropy loss function. 
The rest is left to the discretion of the developer; often, to prevent overtraining, a Dropout layer is used, which disables a certain percentage of neurons every epoch. 
Also, to prevent overfitting, because this is the biggest problem in machine learning, it is better to use a tool such as callback, which, if the model’s performance consistently decreases during training, will automatically stop the model’s training. 
Everything else, namely: the number of epochs, the initial learning coefficient, the optimizer and the batch size - this is what you need to experiment with and select yourself. The model can then be compiled and trained on your data.

## Using transformers library

All of the above has already been implemented in such large libraries as tensorflow and pytorch, but there is also the transformers library, which appeared not so long ago. Using it, you can use already pretrained models that were previously trained on a large amount of data and retrain it on a specific task. By knowing more than its strict domain of application, the model will be robust to outliers and will be able to produce the correct answer even when given unusual inputs. You can even use fine-tuned models from well-known companies that are publicly available and have excellent performance.

### Using pretrained model

Also, such a model can already be used for calculations. This is easy to do using the pipeline() tool. To do this, you must first import the pipeline from the transformers library. As a parameter to this function, you need to specify the problem that needs to be solved, assigning it to a variable. After this, you can give one or several sentences, but with a list of this variable and, for example, if we solve the problem of text classification, that is, determining sentiment, then at the output we will get POSITIVE or NEGATIVE and the model’s confidence in its answer.

### Fine-tuning of pretrained model

The most popular and used models for working with text are BERT and GPT, since we are dealing with the task of multi-class classification, we will use the bert-base model, since BERT copes better with such tasks. The choice of a specific bert-base-cased model depends on the specific task and user. A fine-tune pretrained model requires much less effort compared to training your own model. You also need preprocess data, you can use the AutoTokenizer() from transformers library, you can pass parameters for padding and truncation to the tokenizer parameters. Afterwards, you need to load the model itself from the transformers library, it will be downloaded to the device and saved in the cache. Next, you need to compile the model using the compile() method, where we can set the optimizer and the initial learning coefficient; there is no need to specify the activation function. After this, you can proceed to directly training the model using the fit() method, passing into it either a list of tokens and labels, or a dataset with the appropriate division; if in the preprocess section we made a division into a training and validation set, then you can also use it as validation data indicate our arrays or dataset. If we haven’t done this, then we can still use validation by setting a coefficient that will move from the training set to the validation set for the duration of training. The use of validation is necessary to track the learning process, including tracking retraining. You can also save all intermediate data from the training process in order to later build graphs showing the progression of the model.

### Using fine-tuned model

Also using pipeline() you can use a ready-made trained model for the task you need. The easiest method is to use the Hugging Face website, where you can find a model in the chosen language that will solve the chosen problem. You must specify in the parameters of the pipeline() function the name of the model you want to use and the problem that this model will solve. Or you can separately import the tokenizer of this model using the from_pretrained() method, also specifying the name of the model in the parameters, then using the same method you need to set the model itself.

# Conclusion

The work examined one of the tasks of Natural Language Proccessing, namely Named Entity Recognition, which is one of the most relevant in our time. Methods for solving this problem were also considered using various tools, in particular data preprocessing, model training, additional training of the model, and the use of ready-made models

