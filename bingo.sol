// Nome: <Pedro Lucas Gois Costa>
// Nome: <Debora Everly de Alcantara Barbosa>
// Conta do contrato: <0x137E18e2B9C949Ff83E50dd9db8A2574B66b13dd>

pragma  solidity  ^0.5.0; // Fique a vontade caso queira utilizar outra versão.

contract Bingo{

    struct Cartela{
        uint id;
        uint[5][5] numeros;
    }

    Cartela[] public cartelas;

    address owner;
    uint price = 0.01 ether;
    uint[] nSorteados;
    uint premio;
    address vencedor;
    
    mapping(address => uint) adressCartelas;
    // mapping(uint => address) cartelaAdress;

    event CartelaComprada(address comprador);
    event numeroSorteado(uint);

    constructor() public {
		owner =  msg.sender;
	}

	modifier onlyOwner {
		require(msg.sender == owner, "Somente o dono do contrato pode invocar essa funcao");
		_;
	}
    
    // Função interna que cria os números únicos da cartela
    function createUniqueCartela(uint _id) public pure returns(uint[5][5] memory _random){ 
        for(uint m=0; m<5; m++){
            for(uint n=0; n<5; n++){
                uint rand;
                rand = (uint(keccak256(abi.encodePacked(n, _id))) % 9) + (10 * m);
                _random[m][n] = rand;
            }
        }
        return _random;
    }

    // Função pública que cria uma cartela para o comprador
    function comprarCartela() public payable returns(uint[5][5] memory){
        require(msg.value >= price, "Valor minimo nao atingido");

        uint _id = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))); // Cria um ID unica

        uint[5][5] memory numerosCartela = createUniqueCartela(_id);
        cartelas.push(Cartela(_id, numerosCartela)); // Armazena a cartela numa array geral
        adressCartelas[msg.sender] = _id; // Associa a id daquela cartela ao endereço
        return numerosCartela;
        emit CartelaComprada(msg.sender);
    }

    function sortearNumeros() public onlyOwner{
        uint rand = uint(keccak256(abi.encodePacked(now, msg.sender, block.timestamp))) % 50;
        for(uint x=0; x<nSorteados.length; x++){
            if(rand == nSorteados[x]){
                sortearNumeros();
            }
        }
        nSorteados.push(rand);
        emit numeroSorteado(rand);
    }

    function sacarPremio() public{
        require(msg.sender == vencedor, "Somente o vencedor pode sacar o dinheiro");
        msg.sender.transfer(address(this).balance / 2);
    }

    function verifyWinner(uint[5][5] memory _cartela) private returns(bool){
        uint acertos = 0;
        if(nSorteados.length >= 25){
            for(uint x=0; x<5; x++){
                for(uint y=0; y<5; y++){
                    for(uint z=0; z<nSorteados.length; z++)
                    if(_cartela[x][y] == nSorteados[z]){
                        acertos++;
                    }
                }
            }
        }
        if(acertos >= 25){
            return true;
        }
        return false;
    }

    // Funções de visualização
    function BINGO() public returns(bool){
        for(uint x=0; x<cartelas.length; x++){

            if(cartelas[x].id == adressCartelas[msg.sender]){
                if(verifyWinner(cartelas[x].numeros)){
                    vencedor = msg.sender;
                    return true;
                }
                else{
                    return false;
                }
            }
            
        }
    }

    function verMinhasCartelas() public view returns(uint[5][5] memory){
        uint _Idcartela = adressCartelas[msg.sender];
        for(uint x=0; x< cartelas.length; x++){
            if(cartelas[x].id == _Idcartela){
                return cartelas[x].numeros;
            }
        }
    }
    
    function verNumerosSorteados() public view returns(uint[] memory){
        return nSorteados;
    }

    function verTotalDeCartelas() public view returns(uint){
        return cartelas.length;
    }

    function verPremio() public view returns(uint _prize){
        _prize = (cartelas.length / 2) * price;
    }

    function verGanhador() public view returns(address){
        return vencedor;
    }
}