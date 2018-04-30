# My KiCad Library

## Использование библиотеки в проекте.

Этот шаг нужно проделать хотя бы один раз, чтобы настроить глобальные пути
для KiCad.
Создайте директорию где-то в общем месте, перейтиде в нее и выполните:

```
git clone git@github.com:baden/KiCadLibrary.git
cd KiCadLibrary
make
```


## Roadmap

Подумываю перейти с OpenSCAD на CADQuery.

Проба пера:

```
make 3dshapes/CadTemplate.wrl
```

http://dcowden.github.io/cadquery/

Вот для вдохновления: https://github.com/easyw/kicad-3d-models-in-freecad/

```
sudo apt-get install freecad
sudo apt-get install python-setuptools
sudo easy_install pip
sudo pip install cadquery
```

Для версии FreeCAD 0.17 и старше, модуль
https://github.com/FreeCAD/FreeCAD-addons/blob/master/README.md встроен
и установка не требуется.


sudo apt-get install python-pyside.qtnetwork
https://github.com/jmwright/cadquery-freecad-module/releases/download/v1.0.0.2/cadquery-freecad-module.zip
cp -rf OpenPLM ~/.FreeCAD/Mod/


# Дальнейшее описание не актуально!


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

## Используемые инструменты и зависимости

* [OpenSCAD](http://www.openscad.org/)
* convert from ImageMagick

## Сборка 3d-моделей из исходников

Данный репозиторий используется как рабочая библиотека. Поэтому не забывайте перед публикацией изменений пересобирать модели.

```
    make
```

## Просмотр моделей в OpenSCAD

Список моделей можно посмотреть выполнив команду:

```
    make print-MODELS
```

Посмотреть модель в OpenSCAD можно выполнив

```
    make model-{Название модели}
```

например:

```
    make model-SIM800C
```

## Список моделей в библиотеке

On-line [3D-модели](http://baden.github.io/KiCadLibrary/)
