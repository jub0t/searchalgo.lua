local module = {}
local Origin = game.Workspace.Origin.Position
local Nodes = game.Workspace.Nodes
local Edges = game.Workspace.Edges
local Node = game.ReplicatedStorage.Node

local RANGE = 150

-- data: data generated from the faker.
module.Render = function(data)
	Nodes:ClearAllChildren()
	Edges:ClearAllChildren()

	for i, v in ipairs(data.nodes) do
		local node = Node:Clone()

		node.Position = Vector3.new(
			Origin.X + math.floor(math.random() * RANGE),
			Origin.Y + math.floor(math.random() * RANGE),
			Origin.Z + math.floor(math.random() * RANGE)
		)

		node.Parent = Nodes
		node.Name = i
	end

	-- Now Render Edges
	for i, v in ipairs(data.edges) do
		local rope = game.ReplicatedStorage.RopeConstraint:Clone()
		rope.Thickness = v.weight -- The stronger the connection, the thicker the rope constraint
		rope.Parent = game.Workspace.Edges
		rope.Name = i .. "_" .. v.source .. "_" .. v.target
		rope.Attachment0 = game.Workspace.Nodes:FindFirstChild(v.source):FindFirstChild("Attachment")
		-- Random Color
		rope.Attachment1 = game.Workspace.Nodes:FindFirstChild(v.target):FindFirstChild("Attachment")
	end
end

return module
