---
## Front matter
title: "Отчёт по лабораторной работе №4"
subtitle: "Задание для самостоятельного выполнения"
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

# Постановка задачи

Описание моделируемой сети:
– сеть состоит из N TCP-источников, N TCP-приёмников, двух маршрутизаторов R1 и R2 между источниками и приёмниками (N — не менее 20);
– между TCP-источниками и первым маршрутизатором установлены дуплексные соединения с пропускной способностью 100 Мбит/с и задержкой 20 мс очередью типа DropTail;
– между TCP-приёмниками и вторым маршрутизатором установлены дуплексные соединения с пропускной способностью 100 Мбит/с и задержкой 20 мс очередью типа DropTail;
– между маршрутизаторами установлено симплексное соединение (R1–R2) с пропускной способностью 20 Мбит/с и задержкой 15 мс очередью типа RED, размером буфера 300 пакетов; 
в обратную сторону — симплексное соединение (R2–R1) с пропускной способностью 15 Мбит/с и задержкой 20 мс очередью типа DropTail;
– данные передаются по протоколу FTP поверх TCPReno;
– параметры алгоритма RED: qmin = 75, qmax = 150, qw = 0, 002, pmax = 0.1;
– максимальный размер TCP-окна 32; размер передаваемого пакета 500 байт; время моделирования — не менее 20 единиц модельного времени.

# Задание

1. Для приведённой схемы разработать имитационную модель в пакете NS-2.
2. Построить график изменения размера окна TCP (в Xgraph и в GNUPlot).
3. Построить график изменения длины очереди и средней длины очереди на первом маршрутизаторе.
   
# Выполнение лабораторной работы

Построили модель в NS-2 по приведенной схеме. (рис. [-@fig:001])

![Имитационная модель в NS-2 с N = 30](image/1.PNG){#fig:001 width=70%}

Построили графики изменения размера окна TCP и изменение размера очереди и средней очереди в Xgraph. (рис. [-@fig:002])

![Окно TCP(левый график) и очередь(правый график) для N = 30](image/2.PNG){#fig:002 width=70%}

Построили графики изменения размера окна TCP и изменение размера очереди и средней очереди в Xgraph. (рис. [-@fig:002])

![Окно TCP(левый график) и очередь(правый график) для N = 30](image/2.PNG){#fig:002 width=70%}

Написали следующий код для того, чтобы реализовать моделируемую сеть и построить графики в Xgraph. (рис. [-@fig:003] и рис. [-@fig:004])

![Код(часть 1)](image/3.PNG){#fig:003 width=70%}

![Код(часть 2)](image/4.PNG){#fig:004 width=70%}

Написали следующий код, чтобы построить графики в GNUPlot. (рис. [-@fig:005])

![Код второго файла](image/5.PNG){#fig:005 width=70%}

Получили следующие графики для изменения размера окна TCP (рис. [-@fig:006])

![Изменение размера окна TCP в GNUPlot для N = 30](image/6.PNG){#fig:006 width=70%}

и для изменения размера очереди (рис. [-@fig:007])

![Изменение размера очереди в GNUPlot для N = 30](image/7.PNG){#fig:007 width=70%}

# Выводы

- Для приведённой схемы разработали имитационную модель в пакете NS-2.
- Построили график изменения размера окна TCP (в Xgraph и в GNUPlot).
- Построили график изменения длины очереди и средней длины очереди на первом маршрутизаторе.
