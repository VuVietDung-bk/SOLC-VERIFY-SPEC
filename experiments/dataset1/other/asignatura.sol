pragma solidity >=0.7.0;

contract Asignatura {

	address public profesor; //Usuario que despliega el contrato
	string public nombre;
	string public curso;
	Evaluacion[] public evaluaciones; //Array de evaluaciones
	address[] public matriculas; //Direccion de los alumnos matriculados

	struct Evaluacion {
		string nombre;
		uint fecha;
		uint puntos;
	}

	struct Alumno {
		string nombre;
		string email;
	}

	enum TipoNota {NP, NORMAL, MH}

	struct Nota {
		TipoNota tipo;
		uint calificacion;
	}

	constructor(string memory _nombre, string memory _curso) public {
		profesor = msg.sender; //el profesor despliega el contrato
		nombre = _nombre;
		curso = _curso;
	}

	/*-----------------------------GETTERS------------------------------*/

	function getNombre() public view returns(string memory) {
		return nombre;
	}

	function getCurso() public view returns(string memory) {
		return curso;
	}

	function getDireccionProfesor() public view returns(address) {
		return profesor;
	}

	function evaluacionesLength() public view returns (uint) {
		return evaluaciones.length;
	}
	
	function matriculasLength() public view returns(uint) {
		return matriculas.length;
	}

	/*-----------------------------MÉTODOS------------------------------*/

	function creaEvaluacion(string memory _nombre, uint _fecha, uint _puntos) soloProfesor public payable returns (uint) {
		evaluaciones.push(Evaluacion(_nombre, _fecha, _puntos));
		return evaluaciones.length-1;
	}

	function automatricula(string memory _nombre, string memory _email) noMatriculados noVacio public {
		Alumno memory alumno = Alumno(_nombre, _email);
		datosAlumno[msg.sender] = alumno;
		matriculas.push(msg.sender);
	}

	function quienSoy() soloMatriculados public view returns (string memory _nombre, string memory _email) {
		Alumno memory alumno = datosAlumno[msg.sender];
		_nombre = alumno.nombre;
		_email = alumno.email;
	}

	mapping (address => Alumno) public datosAlumno;

	mapping (address => mapping (uint => Nota)) public calificaciones;

	function califica(address alumno, uint evaluacion, TipoNota tipo, uint calificacion) soloProfesor public {
		Nota memory nota = Nota(tipo, calificacion);
		calificaciones[alumno][evaluacion] = nota;
	}

	function miNota(uint evaluacion) soloMatriculados public view returns (TipoNota _tipo, uint _calificacion) {
		Nota memory nota = calificaciones[msg.sender][evaluacion];
		_tipo = nota.tipo;
		_calificacion = nota.calificacion;
	}

	/*-----------------------------MODIFIERS------------------------------*/
	
	modifier soloProfesor() {
        require(msg.sender == profesor, "Solo permitido al profesor");
        _;
    }
    
    modifier soloMatriculados() {   
        string memory _nombre = datosAlumno[msg.sender].nombre;
        bytes memory b = bytes(_nombre);
        require(b.length != 0, "Solo permitido a alumnos matriculados");
        _;
    }
    
    modifier noMatriculados() {    
        string memory _nombre = datosAlumno[msg.sender].nombre;
        bytes memory b = bytes(_nombre);
        require(b.length == 0, "Solo permitido a alumnos no matriculados");
        _;
    }

    modifier noVacio() {
		string memory _nombre = datosAlumno[msg.sender].nombre;
    	bytes memory b = bytes(_nombre);
        require(b.length != 0, "El nombre no puede ser vacio");
        _;
    }

}