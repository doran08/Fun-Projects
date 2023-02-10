local plr = game.Players.LocalPlayer
local ids = loadstring(game:HttpGet("https://pastebin.com/raw/YPA5bpdr", true))()
	for i,v in pairs(ids) do
		if v == plr.UserId then
		print("Found ID")
	

--[[
--// Fixes \\--




--// Things to add \\--
Showing money and gems in a label
Teleport to worlds

make new colony tab
aut collect gems on pluto and iss
Add auto collect to colonies


]]

--// Main Script
local tycoon = nil
local Playerhead = game.Players.LocalPlayer.Character.Head
local CooldownCollect = 2

--// Things to calculate
local selected = nil
local final = nil
local firstNumber = 0
local SecondNumber = 0

--// Timer

local Secs = 0
local Mins = 0
local hour = 0

--// Tycoons
local FirstTycoon = "FirstTycoon"
local SecondTycoon = "SecondTycoon"
local ThirdTycoon = "ThirdTycoon"
local ForthTycoon = "ForthTycoon"
local FifthTycoon = "FifthTycoon"
local SixthTycoon = "SixthTycoon"




for a,b in pairs(game:GetService("Workspace"):GetChildren()) do
	if b.Name == "FirstTycoon" then
		if b.OwnerName.Value == game.Players.LocalPlayer.Name then
			print(b)
			tycoon = "FirstTycoon"
            
	end
	elseif b.Name == "SecondTycoon" then
		if b.OwnerName.Value == game.Players.LocalPlayer.Name then
			print("2")
			tycoon = "SecondTycoon"
            
	end
	elseif b.Name == "ThirdTycoon" then
		if b.OwnerName.Value == game.Players.LocalPlayer.Name then
			print("3")
			tycoon = "ThirdTycoon"
            
	end
	elseif b.Name == "ForthTycoon" then
		if b.OwnerName.Value == game.Players.LocalPlayer.Name then
			print("4")
			tycoon = "ForthTycoon"
            
	end
	elseif b.Name == "FifthTycoon" then
		if b.OwnerName.Value == game.Players.LocalPlayer.Name then
			print("5")
			tycoon = "FifthTycoon"
            
	end
elseif b.Name == "SixthTycoon" then
    if b.OwnerName.Value == game.Players.LocalPlayer.Name then
        print("6")
        tycoon = "SixthTycoon"
        
end

end
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

print("Anti-AFK has been loaded")


--// Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Space Tycoon",
    LoadingTitle = "Loading Space Tycoon",
    LoadingSubtitle = "by Doran#6880",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    }
 })

local Farm = Window:CreateTab("Farm", 12411648417) -- Title, Image

local Button = Farm:CreateButton({
    Name = "Check Tycoon",
    Callback = function()
        

        Rayfield:Notify({
            Title = "Tycoon",
            Content = "Your Current Tycoon is: "..tycoon,
            Duration = 6.5,
            Image = 4483362458,
            Actions = { -- Notification Buttons
               Ignore = {
                  Name = "Okay!",
                  Callback = function()
                  print("The user tapped Okay!")
               end
            },
         },
         })
    end,
 })

local Slider = Farm:CreateSlider({
   Name = "Auto-Collect Cooldown",
   Range = {0, 60},
   Increment = 1,
   Suffix = "Seconds",
   CurrentValue = 2,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   CooldownCollect = Value
   
   end,
})
local Button = Farm:CreateButton({
    Name = "Check Cooldown",
    Callback = function()
        print(CooldownCollect)
        

        Rayfield:Notify({
            Title = "Cooldown",
            Content = "The cooldown is: "..CooldownCollect,
            Duration = 6.5,
            Image = 4483362458,
            Actions = { -- Notification Buttons
               Ignore = {
                  Name = "Okay!",
                  Callback = function()
                  print("The user tapped Okay!")
               end
            },
         },
         })
    end,
 })


 
 local Toggle = Farm:CreateToggle({
    Name = "Auto-Press (On droppers)",
    CurrentValue = false,
    Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        while Value do
          task.wait()
   if tycoon == FirstTycoon then
    fireclickdetector(game:GetService("Workspace").FirstTycoon.DropperOne.Dropper.Clicked.ClickDetector)
   elseif tycoon == SecondTycoon then
    fireclickdetector(game:GetService("Workspace").SecondTycoon.DropperOne.Dropper.Clicked.ClickDetector)
   elseif tycoon == ThirdTycoon then
    fireclickdetector(game:GetService("Workspace").ThirdTycoon.DropperOne.Dropper.Clicked.ClickDetector)
   elseif tycoon == ForthTycoon then
    fireclickdetector(game:GetService("Workspace").ForthTycoon.DropperOne.Dropper.Clicked.ClickDetector)
   elseif tycoon == FifthTycoon then
    fireclickdetector(game:GetService("Workspace").FifthTycoon.DropperOne.Dropper.Clicked.ClickDetector)
   elseif tycoon == SixthTycoon then
    fireclickdetector(game:GetService("Workspace").SixthTycoon.DropperOne.Dropper.Clicked.ClickDetector)
        end
    end
    end,
 })


local Toggle = Farm:CreateToggle({
    Name = "Auto-Collect Cash",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    while Value do
        task.wait(CooldownCollect)
        if tycoon == "FirstTycoon" then
            for i, v in pairs(game:GetService("Workspace").FirstTycoon.DropperOne.Conveyer.CashColloector.Collector:GetDescendants()) do -- touch interest
                if v.name == "TouchInterest" and v.Parent then
                    firetouchinterest(Playerhead, v.Parent,0)
                    wait(0.1)
                    firetouchinterest(Playerhead, v.Parent,1)
                    break;
                end
            end
          
        elseif tycoon == "SecondTycoon" then
            for i, v in pairs(game:GetService("Workspace").SecondTycoon.DropperOne.Conveyer.CashColloector.Collector:GetDescendants()) do -- touch interest
                if v.name == "TouchInterest" and v.Parent then
                    firetouchinterest(Playerhead, v.Parent,0)
                    wait(0.1)
                    firetouchinterest(Playerhead, v.Parent,1)
                    break;
                end
            end
            

            elseif tycoon == "ThirdTycoon" then
                for i, v in pairs(game:GetService("Workspace").ThirdTycoon.DropperOne.Conveyer.CashColloector.Collector:GetDescendants()) do -- touch interest
                    if v.name == "TouchInterest" and v.Parent then
                        firetouchinterest(Playerhead, v.Parent,0)
                        wait(0.1)
                        firetouchinterest(Playerhead, v.Parent,1)
                        break;
                    end
                end
               
                
                elseif tycoon == "ForthTycoon" then
                    for i, v in pairs(game:GetService("Workspace").ForthTycoon.DropperOne.Conveyer.CashColloector.Collector:GetDescendants()) do -- touch interest
                        if v.name == "TouchInterest" and v.Parent then
                            firetouchinterest(Playerhead, v.Parent,0)
                            wait(0.1)
                            firetouchinterest(Playerhead, v.Parent,1)
                            break;
                        end
                    end
                    
                    elseif tycoon == "FifthTycoon" then
                        for i, v in pairs(game:GetService("Workspace").FifthTycoon.DropperOne.Conveyer.CashColloector.Collector:GetDescendants()) do -- touch interest
                            if v.name == "TouchInterest" and v.Parent then
                                firetouchinterest(Playerhead, v.Parent,0)
                                wait(0.1)
                                firetouchinterest(Playerhead, v.Parent,1)
                                break;
                            end
                        end
                       
                elseif tycoon == SixthTycoon then
  
            for i, v in pairs(game:GetService("Workspace").SixthTycoon.DropperOne.Conveyer.CashColloector.Collector:GetDescendants()) do -- touch interest
                if v.name == "TouchInterest" and v.Parent then
                    firetouchinterest(Playerhead, v.Parent,0)
                    wait(0.1)
                    firetouchinterest(Playerhead, v.Parent,1)
                    break;
                end
            end
            end
        end
    end,
 })


 local Toggle = Farm:CreateToggle({
    Name = "Auto-Collect Gems",
    CurrentValue = false,
    Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    while Value do
        task.wait(CooldownCollect)
        if tycoon == "FirstTycoon" then
            
            for i, v in pairs(game:GetService("Workspace").FirstTycoon.GemConveyor.Collector.Collector.Head:GetDescendants()) do -- touch interest
                if v.name == "TouchInterest" and v.Parent then
                    firetouchinterest(Playerhead, v.Parent,0)
                    wait(0.1)
                    firetouchinterest(Playerhead, v.Parent,1)
                    break;
                end
            end
        elseif tycoon == "SecondTycoon" then
            
            for i, v in pairs(game:GetService("Workspace").SecondTycoon.GemConveyor.Collector.Collector.Head:GetDescendants()) do -- touch interest
                if v.name == "TouchInterest" and v.Parent then
                    firetouchinterest(Playerhead, v.Parent,0)
                    wait(0.1)
                    firetouchinterest(Playerhead, v.Parent,1)
                    break;
                end
            end

            elseif tycoon == "ThirdTycoon" then
                
                for i, v in pairs(game:GetService("Workspace").ThirdTycoon.GemConveyor.Collector.Collector.Head:GetDescendants()) do -- touch interest
                    if v.name == "TouchInterest" and v.Parent then
                        firetouchinterest(Playerhead, v.Parent,0)
                        wait(0.1)
                        firetouchinterest(Playerhead, v.Parent,1)
                        break;
                    end
                end
                
                elseif tycoon == "ForthTycoon" then
                
                    for i, v in pairs(game:GetService("Workspace").ForthTycoon.GemConveyor.Collector.Collector.Head:GetDescendants()) do -- touch interest
                        if v.name == "TouchInterest" and v.Parent then
                            firetouchinterest(Playerhead, v.Parent,0)
                            wait(0.1)
                            firetouchinterest(Playerhead, v.Parent,1)
                            break;
                        end
                    end
                    elseif tycoon == "FifthTycoon" then
                       
                        for i, v in pairs(game:GetService("Workspace").FifthTycoon.GemConveyor.Collector.Collector.Head:GetDescendants()) do -- touch interest
                            if v.name == "TouchInterest" and v.Parent then
                                firetouchinterest(Playerhead, v.Parent,0)
                                wait(0.1)
                                firetouchinterest(Playerhead, v.Parent,1)
                                break;
                    end
                end
                elseif tycoon == SixthTycoon then
                    for i, v in pairs(game:GetService("Workspace").SixthTycoon.GemConveyor.Collector.Collector.Head:GetDescendants()) do -- touch interest
                        if v.name == "TouchInterest" and v.Parent then
                            firetouchinterest(Playerhead, v.Parent,0)
                            wait(0.1)
                            firetouchinterest(Playerhead, v.Parent,1)
                            break;
                end
            end
            end
        end
    end,
 })
local Section = Farm:CreateSection("Collections")


local Button = Farm:CreateButton({
    Name = "Collect Gems",
    Callback = function()
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do -- touch interest
            if v.Name == "AlienGem" then
            v.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            end
        end 
    end,
 })


local Button = Farm:CreateButton({
    Name = "Collect DarkMatter",
    Callback = function()
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do -- touch interest
            if v.Name == "AlienMatter" then
            v.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                
            end
        end
    end,
 })



local Button = Farm:CreateButton({
    Name = "Collect All Flags",
    Callback = function()

        
Rayfield:Notify({
    Title = "Move",
    Content = "Keep MOVING",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("The user tapped Okay!")
       end
    },
 },
 })
 wait(3)
        for _,v in pairs(game:GetService("Workspace").Flags:GetDescendants()) do
            if v.Name == "Capturer" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                wait(15)
            end
            end
    end,
 })

 local Tycoon = Window:CreateTab("Tycoon", 4483362458) -- Title, Image





 local Button = Tycoon:CreateButton({
    Name = "Buy all buttons(Can be annoying)",
    Callback = function()
       if tycoon == "FirstTycoon" then
        for i, v in pairs(game:GetService("Workspace").FirstTycoon:GetDescendants()) do -- touch interest
            if v.Name == "TouchInterest" and v.Parent.Name == "Head"then
            firetouchinterest(Playerhead, v.Parent,0)
                wait(0.1)
               
               firetouchinterest(Playerhead, v.Parent,1)
            end
        end 
    elseif tycoon == SecondTycoon then
        for i, v in pairs(game:GetService("Workspace").SecondTycoon:GetDescendants()) do -- touch interest
            if v.Name == "TouchInterest" and v.Parent.Name == "Head"then
            firetouchinterest(Playerhead, v.Parent,0)
                wait(0.1)
               
               firetouchinterest(Playerhead, v.Parent,1)
            end
        end 

        elseif tycoon == ThirdTycoon then
            for i, v in pairs(game:GetService("Workspace").ThirdTycoon:GetDescendants()) do -- touch interest
                if v.Name == "TouchInterest" and v.Parent.Name == "Head"then
                firetouchinterest(Playerhead, v.Parent,0)
                    wait(0.1)
                   
                   firetouchinterest(Playerhead, v.Parent,1)
                end
            end 
            elseif tycoon == ForthTycoon then
                for i, v in pairs(game:GetService("Workspace").ForthTycoon:GetDescendants()) do -- touch interest
                    if v.Name == "TouchInterest" and v.Parent.Name == "Head"then
                    firetouchinterest(Playerhead, v.Parent,0)
                        wait(0.1)
                       
                       firetouchinterest(Playerhead, v.Parent,1)
                    end
                end 
    elseif tycoon == FifthTycoon then
        for i, v in pairs(game:GetService("Workspace").FifthTycoon:GetDescendants()) do -- touch interest
            if v.Name == "TouchInterest" and v.Parent.Name == "Head"then
            firetouchinterest(Playerhead, v.Parent,0)
                wait(0.1)
               
               firetouchinterest(Playerhead, v.Parent,1)
            end
        end 
       end
    end,
 })


 local Timer = Window:CreateTab("Timer", 119662490)

 local Button = Timer:CreateButton({
    Name = "Show time gui is open",
    Callback = function()

    Rayfield:Notify({
    Title = "Timer",
    Content = "The Timer is: "..hour.." hours, "..Mins.." minutes, "..Secs.." seconds",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("The user tapped Okay!")
       end
    },
 },
 })
    end,
 })

local Toggle = Timer:CreateToggle({
    Name = "Auto Update Timer",
    CurrentValue = false,
    Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    while Value do
        if Secs >= 60 then
            Secs = Secs - 60
            Mins += 1
        end
        if Mins >= 60 then
            Mins -= 60
            hour += 1
        end
        wait()
    end
    end,
 })

local Calculate = Window:CreateTab("Calculate :)", 12411648417)

local Input = Calculate:CreateInput({
   Name = "First number",
   PlaceholderText = "Input Placeholder",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
  firstNumber = Text
   end,
})


local Dropdown = Calculate:CreateDropdown({
    Name = "Things to do with calclulations?",
    Options = {"+","-","/","X"},
    CurrentOption = "Option 1",
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
   selected = Option
    end,
 })

local Input = Calculate:CreateInput({
    Name = "Second number",
    PlaceholderText = "Input Placeholder",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
   SecondNumber = Text
    end,
 })

 local Button = Calculate:CreateButton({
    Name = "Calculate",
    Callback = function()
        if selected == "X" then
            final = firstNumber * SecondNumber
         elseif selected == "/" then
            final = firstNumber / SecondNumber
           elseif selected == "+" then
            final =   firstNumber + SecondNumber
           elseif selected == "-" then
          final = firstNumber - SecondNumber
         end

         print(final)


         Rayfield:Notify({
            Title = "The Answer is",
            Content = final,
            Duration = 6.5,
            Image = 4483362458,
            Actions = { -- Notification Buttons
               Ignore = {
                  Name = "Okay!",
                  Callback = function()
                  print("The user tapped Okay!")
               end
            },
         },
         })
    
    end,
 })

 local Changelogs = Window:CreateTab("Changelogs", 4483362458) -- Title, Image

 local Section = Changelogs:CreateSection("February 9th: Added a calculator because why not")
 local Section = Changelogs:CreateSection("February 8th: Added a function timer, Added some things on the autofarms aswell")
 


 local Credits = Window:CreateTab("Credits", 4483362458) -- Title, Image

 local Section = Credits:CreateSection("Scripting: Doran#6880")
 local Section = Credits:CreateSection("GUI: RayField")



 while true do
    wait(1)
    Secs +=1
end



end
end

