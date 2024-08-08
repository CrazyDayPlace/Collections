local LoadedGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/CrazyDayPlace/Collections/main/Gui/NewVer.lua"))()
local Interfaces = loadstring(game:HttpGet("https://raw.githubusercontent.com/CrazyDayPlace/Collections/main/Gui/interfaces.lua"))()
local SaveManagers = loadstring(game:HttpGet("https://raw.githubusercontent.com/CrazyDayPlace/Collections/main/Gui/savemanager.lua"))()
local Grabs = LoadedGui.Options
local MyWindow = LoadedGui:CreateWindow(
    {
        Size = UDim2.fromOffset(500, 380),
        Title = "Example",
        Theme = "Darker",
        Acrylic = false,
        SubTitle = " [YT: @crazyday3693]",
        TabWidth = 125,
        UpdateLog = "● Release",
        UpdateDate = "08/08/2024",
        IconVisual = nil,
        BlackScreen = false,
        MinimizeKey = Enum.KeyCode.LeftAlt
    }
)

local Tabs =
{
    [1] = MyWindow:AddTab({Title = "General", Name = nil, Icon = "layers"}),
    [2] = MyWindow:AddTab({Title = "Settings", Name = nil, Icon = "settings"})
}


Tabs[1]:AddToggle(
    "Toggle 1",
    {
        Title = "Toggle 1",
        Default = false,
        Callback = function(Value)
            print("Toggle 1 : " .. tostring(Value))
        end
    }
)


Tabs[1]:AddDropdown(
    "Dropdown 1",
    {
        Title = "Dropdown",
        Search = true, -- make your dropdown can search for the values
        UnSelect = true, -- make you can unselect the value
        Multi = false,
        Values = {"Option1", "Option2", "Option3"},
        Default = "Option1" or 1,
        Callback = function(Value)
            print("Dropdown Value Is : " .. Value)
        end
    }
)

Tabs[1]:AddDropdown(
    "Dropdown 2",
    {
        Title = "Multiple Dropdown",
        Multi = true,
        Values = {"Option1", "Option2", "Option3"},
        Default = {},
        Callback = function()
            print("Multiple Dropdown Value Is : " .. table.concat(Grabs["Dropdown 2"].Tables, " : "))
        end
    }
)


local b = Tabs[1]:AddButton(
    {
        Title = "Lock options",
        Description = "Prees the button for lock options!",
        Callback = function()
            for _ , lock in next, Grabs do
                lock:Lock()
            end
        end
    }
)

Tabs[1]:AddButton(
    {
        Title = "Unlock options",
        Description = "Prees the button for unlock options!",
        Callback = function()
            b:Lock()
            for _ , Unlock in next, Grabs do
                Unlock:UnLock()
            end
            task.delay(2.5, function()
                b:UnLock()
            end)
        end
    }
)


do
    Interfaces:SetLibrary(LoadedGui)
    Interfaces:SetFolder("Example/Settings")
    Interfaces:BuildInterfaceSection(Tabs[#Tabs])

    SaveManagers:SetLibrary(LoadedGui)
    SaveManagers:SetFolder("Example/Settings")
    SaveManagers:IgnoreThemeSettings()
    SaveManagers:SetIgnoreIndexes({})
    SaveManagers:BuildConfigSection(Tabs[#Tabs])

    MyWindow:SelectTab(1)
    MyWindow:Minimize("Loaded") -- Hide Gui With The Notify
end
