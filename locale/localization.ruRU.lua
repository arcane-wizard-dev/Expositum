local _, EXT = ...

if EXT.State and EXT.State.libraryIncompatible then return end

if GetLocale() ~= "ruRU" then return end

local L = EXT.Localization

-- Options

L["options.general"] = "Общие параметры"
L["options.general.minimap-button.name"] = "Кнопка у мини-карты"
L["options.general.minimap-button.tooltip"] = "Показывает кнопку у мини-карты."
L["options.general.debug-mode.name"] = "Режим отладки"
L["options.general.debug-mode.tooltip"] = "Показывает в чате отладочные сообщения выбранного уровня."
L["options.general.debug-mode.level.name"] = "Уровень отладки"
L["options.general.debug-mode.level.tooltip"] = "Базовый уровень показывает основные сообщения. Расширенный также показывает технические подробности."
L["options.general.debug-mode.level.value.basic"] = "Базовый"
L["options.general.debug-mode.level.value.advanced"] = "Расширенный"

L["options.tooltip"] = "Подсказка"
L["options.tooltip.section.display"] = "Отображение"
L["options.tooltip.section.item-info"] = "Информация о предмете"
L["options.tooltip.layout.name"] = "Выравнивание"
L["options.tooltip.layout.tooltip"] = "Отображает дополнительную информацию Expositum в двух столбцах или слева в формате «Название: значение»."
L["options.tooltip.layout.columns"] = "Два столбца"
L["options.tooltip.layout.left"] = "По левому краю"
L["options.tooltip.expansion.name"] = "Показывать дополнение"
L["options.tooltip.expansion.tooltip"] = "Отображает соответствующее дополнение для предметов во всплывающей подсказке."
L["options.tooltip.expansion-display.name"] = "Отображение дополнения"
L["options.tooltip.expansion-display.tooltip"] = "Отображает значок дополнения, его название или оба элемента."
L["options.tooltip.expansion-display.both"] = "Значок и название"
L["options.tooltip.expansion-display.badge"] = "Только значок"
L["options.tooltip.expansion-display.name-only"] = "Только название"
L["options.tooltip.category.name"] = "Показывать категорию"
L["options.tooltip.category.tooltip"] = "Отображает соответствующую категорию для предметов во всплывающей подсказке."
L["options.tooltip.rarity.name"] = "Показывать качество"
L["options.tooltip.rarity.tooltip"] = "Отображает соответствующее качество предметов во всплывающей подсказке."
L["options.tooltip.item-level.name"] = "Показывать уровень предмета"
L["options.tooltip.item-level.tooltip"] = "Отображает уровень предмета во всплывающей подсказке."
L["options.tooltip.item-id.name"] = "Показывать ID предмета"
L["options.tooltip.item-id.tooltip"] = "Отображает числовой идентификатор предмета во всплывающей подсказке."
L["options.tooltip.max-stack-size.name"] = "Показывать максимальный размер стопки"
L["options.tooltip.max-stack-size.tooltip"] = "Отображает максимальное количество предметов в одной стопке, а не имеющееся количество."
L["options.tooltip.hide-single-stack.name"] = "Скрывать размер стопки 1"
L["options.tooltip.hide-single-stack.tooltip"] = "Показывает максимальный размер стопки только для складываемых предметов, поэтому для остальных предметов 1 не отображается."
L["options.tooltip.blank-line-position.name"] = "Пустые строки"
L["options.tooltip.blank-line-position.tooltip"] = "Выберите, где вставлять пустые строки относительно дополнительной информации о предмете."
L["options.tooltip.blank-line-position.none"] = "Без пустых строк"
L["options.tooltip.blank-line-position.top"] = "Перед информацией"
L["options.tooltip.blank-line-position.bottom"] = "После информации"
L["options.tooltip.blank-line-position.both"] = "Перед информацией и после неё"

-- General

L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Щёлкните правой кнопкой мыши|r, чтобы открыть настройки."

-- Tooltip

L["tooltip.expansion"] = "Дополнение"
L["tooltip.category"] = "Категория"
L["tooltip.rarity"] = "Качество"
L["tooltip.item-level"] = "Уровень предмета"
L["tooltip.item-id"] = "ID предмета"
L["tooltip.max-stack-size"] = "Макс. размер стопки"
