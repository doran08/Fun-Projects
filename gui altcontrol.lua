workspace:FindFirstChildOfClass('Terrain').WaterWaveSize = 0
workspace:FindFirstChildOfClass('Terrain').WaterWaveSpeed = 0
workspace:FindFirstChildOfClass('Terrain').WaterReflectance = 0
workspace:FindFirstChildOfClass('Terrain').WaterTransparency = 0
game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").FogEnd = 9e9
settings().Rendering.QualityLevel = 1
  for i, v in pairs(game:GetDescendants()) do
	  if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or
					v:IsA("TrussPart") then
					v.Material = "Plastic"
					v.Reflectance = 0
				elseif v:IsA("Decal") then
					v.Transparency = 1
				elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
					v.Lifetime = NumberRange.new(0)
				elseif v:IsA("Explosion") then
					v.BlastPressure = 1
					v.BlastRadius = 1
				end
				end
				for i, v in pairs(game:GetService("Lighting"):GetDescendants()) do
					if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or
						v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
						v.Enabled = false
					end
				end
				workspace.DescendantAdded:Connect(function(child)
					coroutine.wrap(function()
						if child:IsA('ForceField') then
							game:GetService('RunService').Heartbeat:Wait()
							child:Destroy()
						elseif child:IsA('Sparkles') then
							game:GetService('RunService').Heartbeat:Wait()
							child:Destroy()
						elseif child:IsA('Smoke') or child:IsA('Fire') then
							game:GetService('RunService').Heartbeat:Wait()
							child:Destroy()
						end
					end)()
				end)



local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

--// Calculate 1
local droppers = 1
local DHC = 0
local cooldown = 15

--// Calculate 2
local droppers2 = 1
local DHC2 = 0
local cooldown2 = 15

local Window = Rayfield:CreateWindow({
    Name = "Da hood simple gui ",
    LoadingTitle = "Da hood simple gui",
    LoadingSubtitle = "by Doran#6880",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    }
 })

 local main = Window:CreateTab("Main Functions", 12411648417)

 --setups
local Dropdown = main:CreateDropdown({
   Name = "Setups",
   Options = {"Admin","Bank","Klub","Train","Vault"},
   CurrentOption = "Choose teleport",
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
   if Option == "Admin" then

      local args = {
         [1] = getgenv().prefix.."setup admin",
         [2] = "All"
     }
     
     game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  CFrame.new(-872.453674, -32.6421318, -532.476379, 0.999682248, -1.36019978e-08, 0.0252073351, 1.33811247e-08, 1, 8.93094043e-09, -0.0252073351, -8.59080007e-09, 0.999682248)
   elseif Option == "Klub" then

      local args = {
         [1] = getgenv().prefix.."setup klub",
         [2] = "All"
     }
     
     game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))

      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.434479, 0.0355005264, -430.854736, -0.999828756, 9.58909574e-09, -0.0185054261, 9.92017934e-09, 1, -1.77993904e-08, 0.0185054261, -1.79799198e-08, -0.999828756)
      elseif Option == "Bank" then
         local args = {
            [1] = getgenv().prefix.."setup bank",
            [2] = "All"
        }
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))


      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-396.988922, 21.7570763, -293.929779, -0.102468058, -1.9584887e-09, -0.994736314, 7.23731564e-09, 1, -2.71436984e-09, 0.994736314, -7.47735651e-09, -0.102468058)
      elseif Option == "Vault" then
         local args = {
            [1] = getgenv().prefix.."setup vault",
            [2] = "All"
        }
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))


         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-495.485901, 23.1428547, -284.661713, -0.0313318223, -4.10440322e-08, 0.999509037, 2.18453966e-08, 1, 4.17489829e-08, -0.999509037, 2.31427428e-08, -0.0313318223)
      elseif Option == "Train" then
         local args = {
            [1] = getgenv().prefix.."setup train",
            [2] = "All"
        }
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(591.396118, 34.5070686, -146.159561, 0.0698467195, -4.91725913e-08, -0.997557759, 5.03374231e-08, 1, -4.57684664e-08, 0.997557759, -4.70177071e-08, 0.0698467195)
   end
   end,
})





 local Calculate1 = Window:CreateTab("Time to drop", 12411648417)

 local Input = Calculate1:CreateInput({
   Name = "Dhc",
   PlaceholderText = "Input DHC",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)

    DHC = Text

   
   end,
})


local Input = Calculate1:CreateInput({
   Name = "Droppers",
   PlaceholderText = "Input Droppers(max 38)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)

    droppers = Text

   
   end,
})


 local Button = Calculate1:CreateButton({
    Name = "Calculate Dahood cash",
    Callback = function()
    local minutes = DHC / droppers / 28000
    local seconds = minutes  * 60
    local hours = minutes / 60
   

    Rayfield:Notify({
        Title = "I have calculated it for u",
        Content = " it takes "..hours.." hours, "..minutes.." minutes and "..seconds.." seconds",
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

     Rayfield:Notify({
      Title = "I have calculated it for u",
      Content = "to drop "..DHC.." with "..droppers.." droppers",
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


 local Calculate2 = Window:CreateTab("Amount per time", 12411648417)

local Input = Calculate1:CreateInput({
   Name = "Droppers",
   PlaceholderText = "Input Droppers(max 38)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)

    droppers2 = Text

   
   end,
})

local Button = Calculate1:CreateButton({
   Name = "Calculate Dahood cash",
   Callback = function()
      local final2 = droppers2 *7000 
      
      Rayfield:Notify({
         Title = "I have calculated it for u",
         Content = "Your droprate is: "..final2,
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
