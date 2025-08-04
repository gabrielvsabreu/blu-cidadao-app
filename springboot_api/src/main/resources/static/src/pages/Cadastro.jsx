import { useNavigate } from "react-router-dom";

function Cadastro() {
  const navigate = useNavigate();

  function handleCadastro(e) {
    e.preventDefault();
    // Só simula o cadastro
    alert("Cadastro realizado com sucesso!");
    navigate("/login");
  }

  return (
    <div className="p-6 max-w-md mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-4">Cadastro</h2>
      <form onSubmit={handleCadastro} className="space-y-4">
        <input type="text" placeholder="Nome completo" className="w-full border border-gray-300 rounded p-2" />
        <input type="email" placeholder="Email" className="w-full border border-gray-300 rounded p-2" />
        <input type="password" placeholder="Senha" className="w-full border border-gray-300 rounded p-2" />
        <button type="submit" className="w-full bg-sky-950 text-white py-2 rounded">
          Cadastrar
        </button>
      </form>
    </div>
  );
}

export default Cadastro;
