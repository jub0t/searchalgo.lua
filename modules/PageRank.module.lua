local pagerank = {}

pagerank.Run = function(Data)
	-- Initialize PageRank scores for each node
	local PageRankScores = {}
	for i, node in ipairs(Data.nodes) do
		PageRankScores[i] = 1 -- You can set an initial value of 1 for all nodes
	end

	-- Iterate for a fixed number of iterations (or until convergence)
	local numIterations = 10 -- You can adjust the number of iterations as needed
	for iteration = 1, numIterations do
		local newPageRankScores = {}

		-- Calculate PageRank scores for each node
		for i, node in ipairs(Data.nodes) do
			local incomingEdges = {} -- Incoming edges to the current node
			for _, edge in ipairs(Data.edges) do
				if edge.target == i then
					table.insert(incomingEdges, edge)
				end
			end

			-- Calculate the new PageRank score for the current node based on incoming edges
			local newScore = 0
			for _, edge in ipairs(incomingEdges) do
				local sourceNodeIndex = edge.source
				local sourcePageRank = PageRankScores[sourceNodeIndex]
				local edgeWeight = edge.weight
				newScore = newScore + (sourcePageRank * edgeWeight)
			end
			newPageRankScores[i] = newScore
		end

		-- Normalize PageRank scores
		local sum = 0
		for _, score in pairs(newPageRankScores) do
			sum = sum + score
		end
		for i, score in ipairs(newPageRankScores) do
			newPageRankScores[i] = score / sum
		end

		-- Update PageRank scores for the next iteration
		PageRankScores = newPageRankScores
	end

	-- Assign the final PageRank scores to the nodes
	for i, score in ipairs(PageRankScores) do
		Data.nodes[i].pageRank = score
	end

	-- Return the data with PageRank scores
	return Data
end

return pagerank
