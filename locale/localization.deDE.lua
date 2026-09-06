local _, EXT = ...

if GetLocale() ~= "deDE" then return end

local L = EXT.Localization

-- Options

L["options.general"] = "Allgemeine Einstellungen"
L["options.general.minimap-button.name"] = "Minimap-Button"
L["options.general.minimap-button.tooltip"] = "Bei Aktivierung wird der Minimap-Button angezeigt."
L["options.general.debug-mode.name"] = "Debugmodus"
L["options.general.debug-mode.tooltip"] = "Die Aktivierung des Debugmodus zeigt zusätzliche Informationen im Chat an."

L["options.tooltip"] = "Tooltip"
L["options.tooltip.section.display"] = "Darstellung"
L["options.tooltip.section.item-info"] = "Gegenstandsinformationen"
L["options.tooltip.layout.name"] = "Ausrichtung"
L["options.tooltip.layout.tooltip"] = "Zeigt Expositums Zusatzinformationen zweispaltig oder linksbündig als Bezeichnung: Wert an."
L["options.tooltip.layout.columns"] = "Zweispaltig"
L["options.tooltip.layout.left"] = "Linksbündig"
L["options.tooltip.expansion.name"] = "Erweiterung anzeigen"
L["options.tooltip.expansion.tooltip"] = "Zeigt bei Gegenständen im Tooltip die dazugehörige Erweiterung an."
L["options.tooltip.expansion-display.name"] = "Erweiterungsanzeige"
L["options.tooltip.expansion-display.tooltip"] = "Zeigt die Erweiterung als Badge, Name oder beides an. Erfordert eine aktivierte Erweiterungsanzeige."
L["options.tooltip.expansion-display.both"] = "Badge und Name"
L["options.tooltip.expansion-display.badge"] = "Nur Badge"
L["options.tooltip.expansion-display.name-only"] = "Nur Name"
L["options.tooltip.category.name"] = "Kategorie anzeigen"
L["options.tooltip.category.tooltip"] = "Zeigt bei Gegenständen im Tooltip die dazugehörige Kategorie an."
L["options.tooltip.rarity.name"] = "Seltenheit anzeigen"
L["options.tooltip.rarity.tooltip"] = "Zeigt bei Gegenständen im Tooltip die dazugehörige Seltenheit an."
L["options.tooltip.item-level.name"] = "Gegenstandsstufe anzeigen"
L["options.tooltip.item-level.tooltip"] = "Zeigt bei Gegenständen im Tooltip die dazugehörige Gegenstandsstufe an."
L["options.tooltip.item-id.name"] = "Item-ID anzeigen"
L["options.tooltip.item-id.tooltip"] = "Zeigt die numerische ID des Gegenstands im Tooltip an."
L["options.tooltip.max-stack-size.name"] = "Maximale Stapelgröße anzeigen"
L["options.tooltip.max-stack-size.tooltip"] = "Zeigt die maximal mögliche Anzahl pro Stapel an, nicht die aktuell vorhandene Menge."
L["options.tooltip.hide-single-stack.name"] = "Stapelgröße 1 ausblenden"
L["options.tooltip.hide-single-stack.tooltip"] = "Zeigt die maximale Stapelgröße nur bei stapelbaren Gegenständen an. Deaktivieren, um bei nicht stapelbaren Gegenständen auch 1 anzuzeigen."
L["options.tooltip.blank-line.name"] = "Leerzeile einfügen"
L["options.tooltip.blank-line.tooltip"] = "Fügt im Tooltip vor den zusätzlichen Gegenstandsinformationen eine Leerzeile ein."

-- General


L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Rechtsklick|r zum Öffnen der Einstellungen."

-- Chat

-- Tooltip

L["tooltip.expansion"] = "Erweiterung"
L["tooltip.category"] = "Kategorie"
L["tooltip.rarity"] = "Seltenheit"
L["tooltip.item-level"] = "Gegenstandsstufe"
L["tooltip.item-id"] = "Item-ID"
L["tooltip.max-stack-size"] = "Max. Stapelgröße"
