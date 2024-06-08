---
## Front matter
title: "Лабораторная работа № 15"
subtitle: "Модели обслуживания с приоритетами"
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

- Построить различные модели обслуживания с приоритетами
- Построить отчеты по этим моделям
- Проанализировать отчеты по этим моделям

## Постановка задачи 1

На фабрике на складе работает один кладовщик, который выдает запасные части механикам, обслуживающим станки. Время, необходимое для удовлетворения запроса, зависит от типа запасной части. Запросы бывают двух категорий. 
Для первой категории интервалы времени прихода механиков 420 +- 360 сек., время обслуживания - 300 +- 90 сек. Для второй категории интервалы времени прихода механиков 360 +- 240 сек., время обслуживания - 100 +- 30 сек.
Порядок обслуживания механиков кладовщиком такой: запросы первой категории обслуживаются только в том случае, когда в очереди нет ни одного запроса второй категории. Необходимо создать модель работы кладовой, моделирование выполнять в течение восьмичасового рабочего дня.

## Постановка задачи 2

Морские суда двух типов прибывают в порт, где происходит их разгрузка. В порту есть два буксира, обеспечивающих ввод и вывод кораблей из порта. К первому типу судов относятся корабли малого тоннажа, которые требуют использования одного буксира. 
Корабли второго типа имеют большие размеры, и для их ввода и вывода из порта требуется два буксира. Из-за различия размеров двух типов кораблей необходимы и причалы различного размера. Кроме того, корабли имеют различное время погрузки/разгрузки. 
Требуется построить модель системы, в которой можно оценить время ожидания кораблями каждого типа входа в порт. Время ожидания входа в порт включает время ожидания освобождения причала и буксира. 
Корабль, ожидающий освобождения причала, не обслуживается буксиром до тех пор, пока не будет предоставлен нужный причал. Корабль второго типа не займёт буксир до тех пор, пока ему не будут доступны оба буксира.

# Выполнение лабораторной работы

Построим первую модель (рис. [-@fig:001] )

![Код в gpss](image/1.PNG){#fig:001 width=70%}

Сформируем отчет по модели (рис. [-@fig:002] )

![Максимальная длина первой очереди - 8, второй - 3, среднее время ожидания в первой - 883, во второй 152, обработано примерно равное количество заявок 2 категорий](image/2.PNG){#fig:002 width=70%}

Построим вторую модель. (рис. [-@fig:003] )

![Код в gpss](image/3.PNG){#fig:003 width=70%}

Сформируем отчёт. (рис. [-@fig:004] )

![Отчёт по модели](image/4.PNG){#fig:004 width=70%}

Вторая часть отчёта. (рис. [-@fig:005] )

![Среднее время в очереди первого типа - 97, в очереди второго типа - 352, в первом причале было 1345 кораблей, во втором 444, причалы загруженнее буксиров](image/5.PNG){#fig:005 width=70%}

Выводы

- Построили различные модели обработки заказов
- Построили отчеты по этим моделям
- Проанализировали отчеты по этим моделям
