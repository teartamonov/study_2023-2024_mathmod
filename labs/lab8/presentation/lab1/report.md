---
## Front matter
title: "Отчёт по лабораторной работе №1"
subtitle: "Простые модели компьютерной сети"
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

# Цель работы

- Приобретение навыков моделирования сетей передачи данных с помощью средства имитационного моделирования NS-2
- Анализ полученных результатов моделирования
  
# Теоретическое введение

Network Simulator (NS-2) — один из программных симуляторов моделирования процессов в компьютерных сетях. 
NS-2 позволяет описать топологию сети, конфигурацию источников и приёмников трафика, параметры соединений 
(полосу пропускания, задержку, вероятность потерь пакетов и т.д.) и множество других параметров моделируемой системы. 
Данные о динамике трафика, состоянии соединений и объектов сети, а также информация о работе протоколов фиксируются в генерируемом trace-файле.

# Выполнение лабораторной работы

Написали первый скрипт и визуализировали модель. (рис. [-@fig:001])

![Сеть передачи данных, состоящая из двух узлов, соединённых дуплексной линией связи](image/1.PNG){#fig:001 width=70%}

Визуализация первого скрипта (рис. [-@fig:002])

![Передача данных](image/2.PNG){#fig:003 width=70%}

Написали скрипт для немного усложнённой модели и визуализировали. (рис. [-@fig:003])

![Сеть, состоящая из 4 узлов, между узлами n0 и n2, n1 и n2 установлено дуплексное соединение, между узлами n2 и n3 скорость ниже и задержка выше](image/3.PNG){#fig:003 width=70%}

Визуализация. (рис. [-@fig:004])

![Часть пакетов встает в очередь, т.к. линия передачи между узлами n2 и n3 не справляется с потоком данных](image/4.PNG){#fig:004 width=70%}

Написали скрипт для сети с кольцевой топологией. (рис. [-@fig:005])

![Узлы обмениваются данными](image/5.PNG){#fig:005 width=70%}

Визуализация. (рис. [-@fig:006])

![Передача данных в случае повреждения линии передачи](image/7.PNG){#fig:006 width=70%}

## Внесли изменения в предыдущий скрипт, чтобы он соответствовал требованиям упражнения. (рис. [-@fig:007])

![Код скрипта](image/7.PNG){#fig:007 width=70%}

Визуализация. (рис. [-@fig:008])

![Передача данных по кратчайшему пути](image/8.PNG){#fig:008 width=70%}

Визуализация. (рис. [-@fig:009])

![Передача данных по кратчайшему пути в случае разрыва линии между n0 и n1](image/9.PNG){#fig:008 width=70%}

# Выводы

- Приобрели навыки моделирования сетей передачи данных с помощью средства имитационного моделирования NS-2
- Проанализировали полученных результатов моделирования
- Применили полученные знания, выполнив задание
