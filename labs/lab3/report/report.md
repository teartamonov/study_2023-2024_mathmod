---
## Front matter
title: "Отчёт по лабораторной работе №3"
subtitle: "Модель боевых действий"
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

* Рассмотреть модели Ланчестера и научиться их строить
* Написать аналог программы на языке OpenModelica
  
# Теоретическое введение

В противоборстве могут принимать участие как регулярные войска, так и партизанские отряды. 
В общем случае главной характеристикой соперников являются численности сторон. Если в какой-то 
момент времени одна из численностей обращается в нуль, то данная сторона считается проигравшей 
(при условии, что численность другой стороны в данный момент положительна).
Рассмотри три случая ведения боевых действий:
1. Боевые действия между регулярными войсками
2. Боевые действия с участием регулярных войск и партизанских отрядов
   
В первом случае численность регулярных войск определяется тремя факторами: 
* скорость уменьшения численности войск из-за причин, не связанных с боевыми действиями 
(болезни, травмы, дезертирство);
* скорость потерь, обусловленных боевыми действиями противоборствующих сторон 
(что связанно с качеством стратегии, уровнем вооружения, профессионализмом солдат и т.п.);
* скорость поступления подкрепления (задаётся некоторой функцией от времени).

В этом случае модель боевых действий между регулярными войсками описывается следующим образом

dx/dt = -a(t)x(t) - b(t)y(t) + P(t)
dy/dt = -c(t)x(t) - h(t)y(t) + Q(t)

Потери, не связанные с боевыми действиями, описывают члены a(t)x(t) и h(t)y(t), 
члены b(t)y(t) и c(t)x(t) отражают потери на поле боя. 
Функции P(t), Q(t) учитывают возможность подхода подкрепления к войскам Х и У.

Во втором случае в борьбу добавляются партизанские отряды. Нерегулярные войска в отличии 
от постоянной армии менее уязвимы, так как действуют скрытно, в этом случае сопернику 
приходится действовать неизбирательно, по площадям, занимаемым партизанами. Поэтому считается, 
что тем потерь партизан, проводящих свои операции в разных местах на некоторой известной 
территории, пропорционален не только численности армейских соединений, но и численности
самих партизан. В результате модель принимает вид

dx/dt = -a(t)x(t) - b(t)y(t) + P(t)
dy/dt = -c(t)x(t)y(t) - h(t)y(t) + Q(t)

Рассмотренные простейшие модели соперничества соответствуют системам обыкновенных дифференциальных 
уравнений второго порядка, широко распространенным при описании многих естественно научных объектов.

# Постановка задачи

Между страной Х и страной У идет война. Численность состава войск исчисляется от начала войны, 
и являются временными функциями x(t) и y(t). В начальный момент времени страна Х имеет армию 
численностью 150 000 человек, а в распоряжении страны У армия численностью в 100 000 человек. 
Для упрощения модели считаем, что коэффициенты, 

Вариант 1					

| Коэффициенты при x(t) | Коэффициенты при y(t) |
|-----------------------|-----------------------|
| a = 0.45    		| b = 0.85   		|
| c = 0.45    		| h = 0.45   		|

и функции
P(t) = sin(t+8) + 1 
Q(t) = cos(t+8) + 1

Вариант 2					

| Коэффициенты при x(t) | Коэффициенты при y(t) |
|-----------------------|-----------------------|
| a = 0.31    		| b = 0.79   		|
| c = 0.41    		| h = 0.32   		|

P(t) = 2sin(t)
Q(t) = 2cos(t) - постоянны и непрерывны соответственно.


# Задание 

1. Постройте графики изменения численности войск армии Х и армии У для Модели боевых действий 
между регулярными войсками
2. Постройте графики изменения численности войск армии Х и армии У для Модели ведения боевых 
действий с участием регулярных войск и
партизанских отрядов
3. Построить графики на языках Julia и OpenModelica
4. Сравнить результаты


# Выполнение лабораторной работы

##Переписали код из примера лабораторной работы на язык Julia и посмотрели на результат работы программы. (рис. [-@fig:001])

![Julia Plot 1](image/1.0.PNG){ #fig:001 width=70% }

##Сделали то же самое для языка OpenModelica. (рис. [-@fig:002])

![OM Plot 1](image/1.11.PNG){ #fig:002 width=70% }

##Подставили свои данные для случая с регулярными войсками для Julia. (рис. [-@fig:003])

![Julia code 1](image/case1.PNG){ #fig:003 width=70% }

##Нарисовали график для первого случая. (рис. [-@fig:004])

![Julia Plot 2](image/1.1.PNG){ #fig:004 width=70% }

##Подставили свои значения для первого случая в OMEditб, в настройках модели задали промежуток и построили график. (рис. [-@fig:005])

![OM Plot 2](image/1.3.PNG){ #fig:005 width=70% }

##Подставили значения для второго случая и изменили функцию в Julia. (рис. [-@fig:006])

![Julia code 2](image/case2.PNG){ #fig:006 width=70% }

##Построили график и приблизили так, чтобы хорошо было видно изменение функции, понадобилось приблизить до интервала (0, 0.0001). (рис. [-@fig:007])
Видно что функция немного негладкая.

![Julia Plot 3](image/1.2.PNG){ #fig:007 width=70% }

##Сделаем то же самое в OpenModelica. (рис. [-@fig:008])

![OMEdit 1](image/1.4.PNG){ #fig:008 width=70% }

##Посмотрим на график, пришлось сделать разбиение на 500 отрезков интервала (0, 0.001). (рис. [-@fig:009])

![OM Plot 3](image/1.5.PNG){ #fig:009 width=70% }

# Выводы

Построили модели боевых действия для 2 случаев на 2 языках. Выяснили, что на OpenModelica графики точнее. Познакомились и научились строить модели боевых действий.

# Список литературы{.unnumbered}

::: {#refs}
:::
