---
## Front matter
title: "Лабораторная работа № 8"
subtitle: "Модель TCP/AQM"
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

- Реализация модели в xcos

## Теоретическое введение

Рассмотрим упрощённую модель поведения TCP-подобного трафика с регулируемой некоторым AQM алгоритмом динамической интенсивностью потока.
$W(t)$ — средний размер TCP-окна (в пакетах), $Q(t)$ — средний размер очереди (в пакетах), $R(t)$ — время двойного оборота (Round Trip Time, сек.), 
$C$ — скорость обработки пакетов в очереди (пакетов в секунду), $N(t)$ — число TCP-сессий, $p(.)$ — вероятностная функция сброса (отметки на сброс) пакета (значения функции p(·) лежат на интервале [0, 1]).
Сделаем упрощение модели, приняв, что $N(t) = N$ , $R(t) = R$, т.е. указанные величины будем считать постоянными, не изменяющимися во времени. 
Кроме того, положим $p(.) = KQ(t)$, т.е. функция сброса пакетов $p(.)$ пропорциональна длине очереди $Q(t)$.
В результате получим следующую упрощённую модель управления TCP-подобным трафиком:

$$
\dot{W}(t)= \frac{1}{R}​ − \frac{W(t)W(t−R)​KQ(t−R)}{2R}
$$

$$
\dot{Q}(t) =
  \begin{cases}
    \frac{NW(t)}{R} - C       & \quad Q(t) > 0 \\
    max(\frac{NW(t)}{R} - C, 0)  & \quad Q(t) = 0
  \end{cases}
$$

# Выполнение лабораторной работы

Построили схему xcos, моделирующая эту систему. (рис. [-@fig:001])

![Схема xcos, моделирующая систему, С=1](image/1.PNG){#fig:001 width=70%}

Результат работы модели 1. (рис. [-@fig:002])

![Динамика изменения размера NCP окна и размера очереди, С=1](image/2.PNG){#fig:002 width=70%}

Результат работы модели 2. (рис. [-@fig:003])

![Фазовый портрет](image/3.PNG){#fig:003 width=70%}

Запустили модель со скоростью обработки пакетов C=0.9. (рис. [-@fig:004])

![Динамика изменения размера NCP окна и размера очереди и фазовый портрет, С=0.9](image/4.PNG){#fig:004 width=70%}

Построили модель в OpenModelica. (рис. [-@fig:005])

![Код Modelica](image/9.PNG){#fig:005 width=70%}

Запустили модель со скоростью обработки пакетов C=1. (рис. [-@fig:006])

![Динамика изменения размера NCP окна и размера очереди, С=1 в OMEdit](image/5.PNG){#fig:006 width=70%}

Запустили модель со скоростью обработки пакетов C=1. (рис. [-@fig:007])

![Фазовый портрет, С=0.9 в OMEdit](image/6.PNG){#fig:007 width=70%}

Запустили модель со скоростью обработки пакетов C=0.9. (рис. [-@fig:008])

![Динамика изменения размера NCP окна и размера очереди, С=0.9 в OMEdit](image/7.PNG){#fig:008 width=70%}

Запустили модель со скоростью обработки пакетов C=1. (рис. [-@fig:009])

![Фазовый портрет, С=0.9 в OMEdit](image/8.PNG){#fig:009 width=70%}

# Выводы

- Реализовали модели в xcos
- Реализовали модели в OpenModelica
