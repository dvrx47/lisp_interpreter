print('\
  o        ooooooo   ooooo   ooooo\
  8           8     8     o  8    8\
  8           8     8        8    8\
  8           8      ooooo   8oooo\
  8           8           8  8\
  8           8     o     8  8\
  8oooooo  ooo8ooo   ooooo   8\
')



n = 1


--   numeryczne:
-- +
-- -
-- /
-- *
-- rem
-- abs
-- max
-- min


--  relacyjne:
-- <
-- >
-- >=
-- <=
-- =


--   listy:
-- cons
-- car
-- cdr
-- cadr

-- cadr ... (?)

function tokenize( c )
	local tokens = {}
	while c ~= '' do
		if c:sub(1,1) == ' ' then 
			c = c:sub(2,-1)
		elseif c:sub(1,1) == '(' or c:sub(1,1) == ')' then
			tokens[ #tokens + 1 ] = c:sub(1,1)
			c = c:sub(2,-1)
		else
			str = c:match('[^ )]+')
			tokens[ #tokens + 1 ] = str
			c = c:sub(#str + 1,-1)
		end
	end
	return tokens
end



function parse( tokeny )	
	local komenda = {}
	if tokeny[1] == '(' then
		table.remove( tokeny, 1)
		while tokeny[1] ~= ')' do
			if tokeny[1] == '(' then
				komenda[#komenda +1], tokeny = parse( tokeny )
				--komenda[#komenda +1],  = 
			else
				komenda[#komenda +1] = tokeny[1]
				table.remove( tokeny, 1)
			end
			
		end
		table.remove( tokeny, 1)
	end
	return komenda, tokeny
end



while true do
	io.write("[".. n .. "]>")
	-- wczytaj
	komendaRAW = io.read()
	if komendaRAW == eof then
	print("\nBye.")
		goto programEnd
	end
	
	-- idea jest taka by zwróciło to tablicę tokenów	
	
	komenda, nastepna = parse( tokenize(komendaRAW) )
	::ponowWykonanie::

	-- wykonaj komende 
	--print( result )
	
	if nastepna ~= {} then
		komenda, nastepna = parse( nastepna )
		goto ponowWykonanie
	end
	n = n + 1
end

::programEnd::
