--[[
	This ModuleScript(Faker) generates data for us to work with.
	Nodes and edges are generated "randomly"(psuedorandomly).
	
	The algorithm we're trying to make and display using the Roblox
	3D engine is one similiar to Google's PageRank algorithm.
]]
--

local module = {}

--[[
	Parameters: 
		- Node count, the amount of nodes in the network/universal set.
		- Max Edges
]]
--

--[[
	local test = {
	  nodes: {
	    1: {
	      initial_score: 0.1 - 0.9,
	    }
	  },
	  edges: {
	  	{
	  	  source = index,
	  	  target = index(random),
	  	  weight = 0.1 - 0.9,
	  	},
	  }
	}
]]
--

module.GenerateRandomData = function(node_count, max_edges)
	local nodes = {}
	local edges = {}

	-- Loop "node_count" many times

	for i = 1, node_count, 1 do
		nodes[i] = {
			initial_score = 0.2,
		}

		-- Now, since we already know the node count, we generate edges for this node.
		-- Every node can have 0-5 edges.

		local edges_count = math.floor(math.random(0, max_edges))
		for e = 1, edges_count, 1 do
			local edge = {
				source = i,
				target = math.random(1, node_count),
				weight = math.random(),
			}

			table.insert(edges, edge)
		end
	end

	local result = {
		nodes = nodes,
		edges = edges,
	}

	return result
end

return module
