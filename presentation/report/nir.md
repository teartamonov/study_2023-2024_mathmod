---
## Front matter
title: "Научно-исследовательская работа"
subtitle: "Named Entity Recognition (NER)"
author: "Артамонов Тимофей Евгеньевич"

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

# Введение

## Цель работы

Научиться использовать модели для NER, обучать их, дообучать их и подготавливать для них данные.

## Задачи

- Исследовать задачу NER
- Рассмотреть методы преобработки данных
- Рассмотреть методы обучения собственной модели
- Рассмотреть методы дообучения модели с использованием библиотеки transformers
- Дообучить свою модель
- Проанализировать результаты, сравнив её с готовой моделью

## Введение

Text analysis is quite a labor-intensive task, especially nowadays when it can involve entire databases with hundreds of thousands of lines of text. 
Extracting information from such text can take a considerable amount of time and effort from individuals involved in the task. 
Yet, the task of extracting information from text and analyzing it is becoming increasingly important for decision-making in various fields, including business and equally important areas like medicine.
To tackle such tasks, Natural Language Processing (NLP) technologies are employed. One of the key tasks in NLP is Named Entity Recognition (NER). 
Named Entity Recognition is the task of identifying and classifying named entities from text. The main entities include people’s names, geographical and political locations, and organizations. This approach allows for the automatic extraction of important information from unstructured text, which can then be used for various purposes, such as database creation or automation of various text-related processes.
Neural networks are the primary tool for solving the named entity recognition task. These networks are pre-trained on large volumes of data and are capable of accurately predicting the correct entity tag.
The goal of this work is to learn how to utilize such models, train and fine-tune pre-trained models, and also explore text vectorization methods.

# Основная часть

## Предобработка данных

## Обучение модели с нуля

## Подходящие под эту задачи функции

## Использование библиотеки Transformers

### Дообучение подготовленной модели

### Использование уже обученной модели

## Пример дообученной модели и сравнение ее метрик с готовой широко-используемой моделью

# Выводы

В работе были исследованы разновидности моделей с урнами, а так же было рассмотренно их применение в различных областях. Таким образом, 
хотя модель с урнами - это и простой мысленный эксперимент, различные её виды внесли вклад в развитие многих областей нашей жизни и используются и по сей день.

# Список литературы{.unnumbered}

::: {#refs}
:::
