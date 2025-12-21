-- Copied from https://github.com/joshxviii/animalese-typing

local translate = {
	["a"] = "a",
	["b"] = "b",
	["c"] = "c",
	["d"] = "d",
	["e"] = "e",
	["f"] = "f",
	["g"] = "g",
	["h"] = "h",
	["i"] = "i",
	["j"] = "j",
	["k"] = "k",
	["l"] = "l",
	["m"] = "m",
	["n"] = "n",
	["o"] = "o",
	["p"] = "p",
	["q"] = "q",
	["r"] = "r",
	["s"] = "s",
	["t"] = "t",
	["u"] = "u",
	["v"] = "v",
	["w"] = "w",
	["x"] = "x",
	["y"] = "y",
	["z"] = "z",
	["A"] = "a",
	["B"] = "b",
	["C"] = "c",
	["D"] = "d",
	["E"] = "e",
	["F"] = "f",
	["G"] = "g",
	["H"] = "h",
	["I"] = "i",
	["J"] = "j",
	["K"] = "k",
	["L"] = "l",
	["M"] = "m",
	["N"] = "n",
	["O"] = "o",
	["P"] = "p",
	["Q"] = "q",
	["R"] = "r",
	["S"] = "s",
	["T"] = "t",
	["U"] = "u",
	["V"] = "v",
	["W"] = "w",
	["X"] = "x",
	["Y"] = "y",
	["Z"] = "z",
	["1"] = "0",
	["2"] = "1",
	["3"] = "2",
	["4"] = "3",
	["5"] = "4",
	["6"] = "5",
	["7"] = "6",
	["8"] = "7",
	["9"] = "8",
	["0"] = "9",
	-- ["!"] = "exclamation",
	["!"] = "Gwah",
	["~"] = "tilde",
	["@"] = "at",
	-- ["?"] = "question",
	["?"] = "Deska",
	["#"] = "pound",
	["$"] = "dollar",
	["%"] = "percent",
	["^"] = "caret",
	["&"] = "ampersand",
	["*"] = "asterisk",
	["("] = "parenthesis_open",
	[")"] = "parenthesis_closed",
	["["] = "bracket_open",
	["]"] = "bracket_closed",
	["{"] = "brace_open",
	["}"] = "brace_closed",
	["/"] = "slash_forward",
	["\\"] = "slash_back",
}

local PLAYER_PAPLAY = 1
local PLAYER_FFPLAY = 2
local player = PLAYER_PAPLAY

local soundPath = vim.fn.expand("~/.animalese")
if not vim.uv.fs_stat(soundPath) then
	vim.notify("Animalese plugin disabled.")
	return
end
if player == PLAYER_PAPLAY and not vim.fn.executable("paplay") then
	vim.notify("Player not found - Animalese plugin disabled.")
	return
end
if player == PLAYER_FFPLAY and not vim.fn.executable("ffplay") then
	vim.notify("Player not found - Animalese plugin disabled.")
	return
end

local function getPlayerCommand(char, volume, pitch)
	if not volume then volume = 0.5 end
	if not pitch then pitch = 1.0 end

	if player == PLAYER_PAPLAY then
		return {
			"paplay",
			{ soundPath.. "/" .. char .. ".wav" }
		}
	end

	if player == PLAYER_FFPLAY then
		return {
			"ffplay",
			{
				"-hide_banner",
				"-loglevel", "error",
				"-nodisp",
				"-autoexit",
				"-af", "volume=" .. tostring(volume) .. ",asetrate=48000*" .. tostring(pitch),
				soundPath.. "/" .. char .. ".wav"
			}
		}
	end

	return {}
end

vim.api.nvim_create_autocmd('InsertCharPre', {
	callback = function()
		local char = vim.v.char
		local tchar = translate[char] or "default"

		local isUpper = tonumber(char) == nil and string.len(tchar) == 1 and char == string.upper(char)
		local volume = isUpper and 0.7 or 0.5
		local pitch = isUpper and 1.6 + (math.random() * 0.15) or 1.0

		local p = getPlayerCommand(tchar, volume, pitch)

		vim.uv.spawn(
			p[1],
			{
				args = p[2]
			},
			function(c, _)
				if c == 0 then return end

				vim.notify(
					"audio player returned error code " .. tostring(c),
					vim.log.levels.WARN
				)
			end
		)
	end,
})
