
// sorted array

struct Persona {
	let nombre: String?
	let edad: Int?
	let genero: String?
}

var arrayHijosYYo: [Persona] =  []
let yo = Persona(nombre: "Luciano", edad: 43, genero: "masculino")
let hijoMayor = Persona(nombre: "Antonio", edad: 4, genero: "masculino")
let hijoMenor = Persona(nombre: "Nino", edad: 1, genero: "masculino")

arrayHijosYYo.append(yo)
arrayHijosYYo.append(hijoMayor)
arrayHijosYYo.append(hijoMenor)

debugPrint("\(arrayHijosYYo)")

let masViejo = arrayHijosYYo.sorted(by: { $0.edad! > $1.edad! })
let masJoven = arrayHijosYYo.sorted(by: { $0.edad! < $1.edad! } )

for item in masViejo {
	debugPrint("+ VIEJO: \(String(describing: item.nombre)), separator: \(String(describing: item.edad))")
}

for item in masJoven {
	debugPrint("+ JOVEN: \(String(describing: item.nombre)), separator: \(String(describing: item.edad))")
}
