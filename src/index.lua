game.Workspace:FindFirstChild("Baseplate"):Destroy() -- Fuck the baseplate

local Faker = require(game.ReplicatedFirst.Faker)
local Render = require(game.ReplicatedFirst.Render)
local PageRank = require(game.ReplicatedFirst.PageRank)

local Data = Faker.GenerateRandomData(100, 4)
Render.Render(Data)

while true do
	task.wait(0.5)
	local New = PageRank.Run(Data)
	Data = New
	Render.Render(New)
end