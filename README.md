# My KiCad Library

## Использование библиотеки в проекте.

В редакторе **pcbnew** зайдите в меню **Preferences -> Footprint Libraries Manager**
и добавьте библиотеку, заполнив поля следующим образом:

* Nickname = Baden_Github
* Library Path = https://github.com/baden/KiCadLibrary
* Plugin Type = Github

Чтобы использовать 3D-модели, загрузите их как описано в разделе **Загрузка 3d моделей**

## Загрузка 3d моделей.

Нужно загрузить каталог 3dshapes в рабочий каталог проекта (сохранив подкаталог 3dshapes).
Для этого зайдите в каталог с проектом и выполните в консоли команду:

```
svn checkout https://github.com/baden/KiCadLibrary/trunk/3dshapes && rm -rf 3dshapes/.svn
```

## Сборка 3d-моделей из исходников

Данный репозиторий используется как рабочая библиотека. Поэтому не забывайте перед публикацией изменений пересобирать модели.

```
    make models
```

## Просмотр моделей в OpenSCAD

```
    model-SIM800C
```
