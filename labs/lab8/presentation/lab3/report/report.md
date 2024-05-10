---
## Front matter
title: "Лабораторная работа № 6"
subtitle: "Модель хищник–жертва"
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

## Теоретическое введение

Модель «хищник–жертва» (модель Лотки — Вольтерры) представляет собой модель межвидовой конкуренции. 
$x = ax - bxy$, 
$y = cxy - dy$
где x - количество жертв; y - количество хищников; a, b, c, d - коэффициенты, отражающие взаимодействия между видами: a - коэффициент рождаемости жертв; b - коэффициент убыли жертв; c - коэффициент рождения хищников; d - коэффициент убыли хищников.

## Цель работы

- Реализация модели в xcos
- Реализация модели с помощью блока Modelica в xcos
- Реализация модели в OpenModelica
  
# Выполнение лабораторной работы

Построили модель хищник-жертва в xcos. (рис. [-@fig:001])

![Схема в xcos](image/0.PNG){#fig:001 width=70%}

Запустили модель. (рис. [-@fig:002], рис. [-@fig:003])

![Динамика изменения численности хищников и жертв модели](image/1.PNG){#fig:002 width=70%}

![Фазовый портрет модели](image/2.PNG){#fig:003 width=70%}

Реализовали модель хищник-жертва с помощью блока Modelica. (рис. [-@fig:004])

![Схема в xcos](image/3.PNG){#fig:004 width=70%}

Результат моделирования совпадает с результатом предыдущей схемы. (рис. [-@fig:005])

![Динамика изменения численности хищников и жертв и фазовый портрет модели](image/4.PNG){#fig:005 width=70%}

Реализуем модель в OpenModelica. (рис. [-@fig:006])

![Код в OpenModelica](image/5.PNG){#fig:006 width=70%}

Результат моделирования совпадает с моделью в xcos. (рис. [-@fig:007] и рис. [-@fig:008])

![Динамика изменения численности хищников и жертв модели в OpenModelica](image/6.PNG){#fig:007 width=70%}

![Фазовый портрет модели в OpenModelica](image/7.PNG){#fig:008 width=70%}

# Выводы

- Реализовали модели в xcos
- Реализовали модели с помощью блока Modelica в xcos
- Реализовали модели в OpenModelica
