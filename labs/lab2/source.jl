using DifferentialEquations
using Plots

#Начальные условия
k = 25 #Расстояние
d = 5.1 #Скорость
fi = 3*pi/4

#2 варианта начального положения катера и 2 варианта интервалов
x1 = k/(d+1)
x2 = k/(d-1)
tetha1 = (0.0,2*pi)
tetha2 = (-pi,pi)

#Функция, описывающая движение катера
f1(r, p, t) = r / sqrt(25.01)

#Функция, описывающая движение лодки
f2(t) = tan(fi)*t

#Задача коши
prob1 = ODEProblem(f1, x1, tetha1)
prob2 = ODEProblem(f1, x2, tetha2)

#Решение
sol1 = solve(prob1, saveat = 0.01)
sol2 = solve(prob2, saveat = 0.01)

#Отрезок времени для графика
t = 0:0.01:30
#Массиво углов фи для построение прямой
xd = [fi]*length(t)

#График варианта 1
plot(sol1.t, sol1.u, proj = :polar, title="Задача о погоне, вариант 1", label = "Катер береговой охраны")
plot!(xd, f2.(t), label="Браконьерская лодка")

#График варианта 2
plot(sol2.t, sol2.u, proj = :polar, title="Задача о погоне, вариант 2", label = "Катер береговой охраны")
plot!(xd, f2.(t), label="Браконьерская лодка")
