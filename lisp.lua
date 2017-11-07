-- wersja do dokonczenia
function printf_(t)
	io.write("{")
	for i=1, #t do
		if type(t[i]) == 'table' then
		printf_(t[i])
		else
			io.write(t[i])
		end
		if i ~= #t then
				io.write(", ")
			end
	end
	io.write("}")
end

function printf(t)
	print( printf_(t) )
end


------------------------------







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
-- abs
-- max
-- min


--  relacyjne:
-- <
-- >
-- >=
-- <=
-- =

-- definiowanie
-- define  - definiuje zmienną
-- defun  - definiuje funkcje


--   listy:
-- cons
-- car
-- cdr
-- cadr

function dodawanie(args)
	local suma = 0
	for i=1, #args do
		if type(args[i]) == 'table' then
				local result = wykonajKomende( args[i] )
				if tonumber(result) == nil then
					return result
				end
				suma = suma + result
			else
			
			if tonumber(args[i]) == nil then
				local skladnik = const[ args[i] ]
				if skladnik == nil then
					return 'error: zmienna o nazwie: '..args[i]..' jest niezdefiniowana'
				else
					suma = suma + skladnik
				end
			else
				suma = suma + args[i]
			end
		end
	end
	return suma
end

function odejmowanie( args )
	if #args ~= 2 then
		return 'error: funkcja (-) jest dwuargumentowa'
	end
	local a1
	local a2
	if type( args[1] ) == 'table' then
		a1 = wykonajKomende( args[1] )
	elseif tonumber( args[1] ) == nil then
		a1 = const [ args[1] ]
		if a1 == nil then 
			return 'error: zmienna o nazwie: '..args[1]..' jest niezdefiniowana' 
		end
	else
		a1 = args[1]	
	end
	
	if type( args[2] ) == 'table' then
		a2 = wykonajKomende( args[2] )
	elseif tonumber( args[2] ) == nil then
		a2 = const [ args[2] ]
		if a2 == nil then 
			return 'error: zmienna o nazwie: '..args[2]..' jest niezdefiniowana' 
		end
	else
		a2 = args[2]	
	end
	
	return a1-a2
end

function mnozenie( args )
	if #args ~= 2 then
		return 'error: funkcja (*) jest dwuargumentowa'
	end
	local a1
	local a2
	
	if type( args[1] ) == 'table' then
		a1 = wykonajKomende( args[1] )
	elseif tonumber( args[1] ) == nil then
		a1 = const [ args[1] ]
		if a1 == nil then 
			return 'error: zmienna o nazwie: '..args[1]..' jest niezdefiniowana' 
		end
	else
		a1 = args[1]	
	end
	
	if type( args[2] ) == 'table' then
		a2 = wykonajKomende( args[2] )
	elseif tonumber( args[2] ) == nil then
		a2 = const [ args[2] ]
		if a2 == nil then 
			return 'error: zmienna o nazwie: '..args[2]..' jest niezdefiniowana' 
		end
	else
		a2 = args[2]	
	end
	
	return a1*a2
end

function dzielenie( args )
	if #args ~= 2 then
		return 'error: funkcja (/) jest dwuargumentowa'
	end
	
	local a1 
	local a2
	
	if type( args[1] ) == 'table' then
		a1 = wykonajKomende( args[1] )
	elseif tonumber( args[1] ) == nil then
		a1 = const [ args[1] ]
		if a1 == nil then 
			return 'error: zmienna o nazwie: '..args[1]..' jest niezdefiniowana' 
		end
	else
		a1 = args[1]	
	end
	
	if type( args[2] ) == 'table' then
		a2 = wykonajKomende( args[2] )
	elseif tonumber( args[2] ) == nil then
		a2 = const [ args[2] ]
		if a2 == nil then 
			return 'error: zmienna o nazwie: '..args[2]..' jest niezdefiniowana' 
		end
	else
		a2 = args[2]	
	end
	
	if a2 == 0 then
		return 'error: dzielenie przez 0'
	end
	
	return a1/a2
end

function wabs(args)
	if #args ~= 1 then
		return 'error funkcja (abs) jest jednoargumentowa'
	end
	
	
	if type(args[1]) == 'table' then
				local result = wykonajKomende( args[1] )
				if tonumber(result) == nil then
					return result
				end
				return math.abs( result )
			else
			
			if tonumber(args[1]) == nil then
				local ar = const[ args[1] ]
				if ar == nil then
					return 'error: zmienna o nazwie: '..args[1]..' jest niezdefiniowana'
				else
					return math.abs(ar)
				end
			else
				return math.abs(args[1])
			end
	end
	
end


function maksimum( args ) 
	
	local max = -math.huge
	
	for i=1, #args do
		if type(args[i]) == 'table' then
				local result = wykonajKomende( args[i] )
				if tonumber(result) == nil then
					return result
				end
				if result > max then max = result end
			else
			
			if tonumber(args[i]) == nil then
				local zmienna = const[ args[i] ]
				if zmienna == nil then
					return 'error: zmienna o nazwie: '..args[i]..' jest niezdefiniowana'
				else
					if zmienna > max then 
						max = zmienna 
					end
				end
			else
				if tonumber(args[i]) > max then 
					max = tonumber(args[i]) 
				end
			end
		end
	end
	return max
end


function minimum( args ) 
	
	local min = math.huge
	
	for i=1, #args do
		if type(args[i]) == 'table' then
				local result = wykonajKomende( args[i] )
				if tonumber(result) == nil then
					return result
				end
				if result < min then min = result end
			else
			
			if tonumber(args[i]) == nil then
				local zmienna = const[ args[i] ]
				if zmienna == nil then
					return 'error: zmienna o nazwie: '..args[i]..' jest niezdefiniowana'
				else
					if zmienna < min then min = zmienna end
				end
			else
				if tonumber(args[i]) < min then min = tonumber(args[i]) end
			end
		end
	end
	
	return min
end

function altb( args )
	if #args ~= 2 then
		return 'error: funkcja (<) jest dwuargumentowa'
	end
	
	local a1 
	local a2
	
	if type( args[1] ) == 'table' then
		a1 = wykonajKomende( args[1] )
	elseif tonumber( args[1] ) == nil then
		a1 = const [ args[1] ]
		if a1 == nil then 
			return 'error: zmienna o nazwie: '..args[1]..' jest niezdefiniowana' 
		end
	else
		a1 = args[1]	
	end
	
	if type( args[2] ) == 'table' then
		a2 = wykonajKomende( args[2] )
	elseif tonumber( args[2] ) == nil then
		a2 = const [ args[2] ]
		if a2 == nil then 
			return 'error: zmienna o nazwie: '..args[2]..' jest niezdefiniowana' 
		end
	else
		a2 = args[2]	
	end
	
	return tonumber(a1)<tonumber(a2)
end

function blta( args )
	if #args ~= 2 then
		return 'error: funkcja (>) jest dwuargumentowa'
	end
	
	return altb( { args[2], args[1] } )
end

function aletb( args )
	if #args ~= 2 then
		return 'error: funkcja (<) jest dwuargumentowa'
	end
	
	local a1 
	local a2
	
	if type( args[1] ) == 'table' then
		a1 = wykonajKomende( args[1] )
	elseif tonumber( args[1] ) == nil then
		a1 = const [ args[1] ]
		if a1 == nil then 
			return 'error: zmienna o nazwie: '..args[1]..' jest niezdefiniowana' 
		end
	else
		a1 = args[1]	
	end
	
	if type( args[2] ) == 'table' then
		a2 = wykonajKomende( args[2] )
	elseif tonumber( args[2] ) == nil then
		a2 = const [ args[2] ]
		if a2 == nil then 
			return 'error: zmienna o nazwie: '..args[2]..' jest niezdefiniowana' 
		end
	else
		a2 = args[2]	
	end
	
	return tonumber(a1)<=tonumber(a2)
end

function bleta( args )
	if #args ~= 2 then
		return 'error: funkcja (<) jest dwuargumentowa'
	end
	
	return aletb( { args[2], args[1]} )
end

function rowne( args )
	if #args ~= 2 then
		return 'error: funkcja (<) jest dwuargumentowa'
	end
	
	local a1 
	local a2
	
	if type( args[1] ) == 'table' then
		a1 = wykonajKomende( args[1] )
	elseif tonumber( args[1] ) == nil then
		a1 = const [ args[1] ]
		if a1 == nil then 
			return 'error: zmienna o nazwie: '..args[1]..' jest niezdefiniowana' 
		end
	else
		a1 = args[1]	
	end
	
	if type( args[2] ) == 'table' then
		a2 = wykonajKomende( args[2] )
	elseif tonumber( args[2] ) == nil then
		a2 = const [ args[2] ]
		if a2 == nil then 
			return 'error: zmienna o nazwie: '..args[2]..' jest niezdefiniowana' 
		end
	else
		a2 = args[2]	
	end
	
	return tonumber(a1)==tonumber(a2)
end

function nowazmienna( args )
	if #args ~= 2 then
		return 'error: funkcja (var) jest jednoargumentowa'
	end
	
	local a1
	
	if type( args[2] ) == 'table' then
		a1 = wykonajKomende( args[2] )
	elseif tonumber( args[2] ) == nil then
		a1 = const [ args[2] ]
		if a1 == nil then 
			return 'error: zmienna o nazwie: '..args[2]..' jest niezdefiniowana' 
		end
	else
		a1 = args[2]	
	end
	
	const[ args[1] ] = a1
	return 'OK'
end

function potega( args )
	if #args ~= 2 then
		return 'error: funkcja (pow) jest dwuargumentowa'
	end
	
	local a1 
	local a2
	
	if type( args[1] ) == 'table' then
		a1 = wykonajKomende( args[1] )
	elseif tonumber( args[1] ) == nil then
		a1 = const [ args[1] ]
		if a1 == nil then 
			return 'error: zmienna o nazwie: '..args[1]..' jest niezdefiniowana' 
		end
	else
		a1 = args[1]	
	end
	
	if type( args[2] ) == 'table' then
		a2 = wykonajKomende( args[2] )
	elseif tonumber( args[2] ) == nil then
		a2 = const [ args[2] ]
		if a2 == nil then 
			return 'error: zmienna o nazwie: '..args[2]..' jest niezdefiniowana' 
		end
	else
		a2 = args[2]	
	end
	
	return math.pow( tonumber(a1), tonumber(a2) )
end

env = 	{
			['+']  		= 	dodawanie,
			['-']   	= 	odejmowanie,
			['*']   	= 	mnozenie,
			['/']   	= 	dzielenie,
			['abs'] 	= 	wabs,
			['max']		=	maksimum,
			['min']		= 	minimum,
			['pow']		=	potega,
			
			['<']		= 	altb,
			['>']		=	blta,
			['<=']		=	aletb,
			['>=']		=	bleta,
			['=']		=	rowne,
			['define']	= 	nowazmienna
		}
		
const = {
			['pi'] = math.pi,
			['e']  = math.exp(1) 
		}
		
function wykonajKomende( komenda )
	funkcja = komenda[1]
	
	table.remove(komenda, 1)
	--teraz reszta tablicy komenda to argumenty
	wykonywacz = env[ funkcja ]
	
	if wykonywacz == nil then
		return 'error: funkcja o nazwie: '..funkcja..' jest niezdefiniowana.'
	else
		return wykonywacz(komenda) 
	end
end

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
	::nowakomenda::
	io.write("[".. n .. "]> ")
	n = n + 1
	-- wczytaj
	komendaRAW = io.read()
	
	--eof == ctrl+d
	if komendaRAW == eof then
	print("\nBye.")
		goto programEnd
	end
	
	--tutaj sprawiam by nie bylo rozroznienia wielkosci liter
	komendaRAW = komendaRAW:lower()
	
	komenda, nastepna = parse( tokenize(komendaRAW) )
	::ponowWykonanie::
	
	funkcja = komenda[1]
	if funkcja == nil then 
		goto nowakomenda 
	end
	
	table.remove(komenda, 1)
	--teraz reszta tablicy komenda to argumenty
	
	wykonywacz = env[ funkcja ]
	
	if wykonywacz == nil then
		print('error: funkcja o nazwie: '..funkcja..' jest niezdefiniowana.')
		goto nowakomenda
	else
		print( wykonywacz(komenda) )
	end
	
	-- wykonaj komende 
	--printf( komenda )
	
	if #nastepna > 0  then
		komenda, nastepna = parse( nastepna )
		goto ponowWykonanie
	end
	
end

::programEnd::
