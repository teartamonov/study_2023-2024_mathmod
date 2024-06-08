---
## Front matter
title: "Лабораторная работа № 16"
subtitle: "Задачи оптимизации. Модель двух стратегий обслуживания"
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

- Построить модели двух стратегий обслуживания
- Построить отчеты по этим моделям
- Проанализировать отчеты и найти лучшую стратегию
- Найти оптмильное количество пунктов для каждой стратегии

## Постановка задачи

На пограничном контрольно-пропускном пункте транспорта имеются 2 пункта пропуска. Интервалы времени между поступлением автомобилей имеют экспоненциальное распределение со средним значением m. 
Время прохождения автомобилями пограничного контроля имеет равномерное распределение на интервале [a, b].
Предлагается две стратегии обслуживания прибывающих автомобилей:
1. Автомобили образуют две очереди и обслуживаются соответствующими пунктами пропуска
2. Автомобили образуют одну общую очередь и обслуживаются освободившимся пунктом пропуска.
Исходные данные: m = 1.75 мин, a = 1 мин, b = 7 мин.

# Выполнение лабораторной работы

Построим модель для первой стратегии (рис. [-@fig:001] )

![Код в gpss](image/1.PNG){#fig:001 width=70%}

Сформируем отчет по модели (рис. [-@fig:002] )

![Отчёт по модели для первой стратегии](image/2.PNG){#fig:002 width=70%}

Построим модель для второй стратегии. (рис. [-@fig:003] )

![Код в gpss](image/3.PNG){#fig:003 width=70%}

Сформируем отчёт. (рис. [-@fig:004] )

![Отчёт по модели для второй стратегии](image/4.PNG){#fig:004 width=70%}

Заполним таблицу для сравнения стратегий. (рис. [-@fig:005] )

![Вторая стратегия лучше: максимальная и средняя очереди меньше, время ожидания меньше](image/5.PNG){#fig:005 width=70%}

Подберем оптимальное число пунктов для второй стратегии  (рис. [-@fig:006] )

![Самый оптимальный вариант - 3 пункта, все требования выполнены](image/6.PNG){#fig:006 width=70%}

Подберем оптимальное число пунктов для первой стратегии  (рис. [-@fig:007] )

![Код в gpss для 3 пунктов](image/7.PNG){#fig:007 width=70%}

Сформируем отчёт  (рис. [-@fig:008] )

![Время ожидания слишком большое для 3 пунктов](image/8.PNG){#fig:008 width=70%}

Подберем оптимальное число пунктов для первой стратегии  (рис. [-@fig:009] )

![Код в gpss для 4 пунктов](image/9.PNG){#fig:009 width=70%}

Сформируем отчёт  (рис. [-@fig:010] )

![Самый оптимальный вариант - 4 пункта, все требования выполнены](image/10.PNG){#fig:010 width=70%}

# Выводы

- Построили модели двух стратегий обслуживания
- Построили отчеты по этим моделям
- Проанализировали отчеты и найти лучшую стратегию
- Нашли оптмильное количество пунктов для каждой стратегии
