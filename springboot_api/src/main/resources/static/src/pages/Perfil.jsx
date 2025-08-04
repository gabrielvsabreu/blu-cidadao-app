import { useAuth } from "../hooks/useAuth";
import { useState, useEffect } from "react";

function Perfil() {
  const { usuario } = useAuth();
  const [editando, setEditando] = useState(false);
  const [nome, setNome] = useState("");
  const [cidade, setCidade] = useState("");
  const [cpf, setCpf] = useState("");
  const [avatar, setAvatar] = useState("");
  const [historico, setHistorico] = useState([]);

  // Carrega dados do perfil ao abrir
  useEffect(() => {
    if (usuario?.email) {
      const dados = JSON.parse(localStorage.getItem(`perfil_${usuario.email}`));
      if (dados) {
        setNome(dados.nome || "");
        setCidade(dados.cidade || "");
        setCpf(dados.cpf || "");
        setAvatar(dados.avatar || "");
      }
      // Exemplo de histórico
      setHistorico([
        { tipo: "Consulta", desc: "Cardiologista", data: "2025-07-10" },
        { tipo: "Solicitação", desc: "Buraco na rua", data: "2025-07-05" },
        { tipo: "Vaga de Emprego", desc: "Programador Java", data: "2025-06-30" },
      ]);
    }
  }, [usuario]);

  function salvarEdicao(e) {
    e.preventDefault();
    setEditando(false);
    if (usuario?.email) {
      localStorage.setItem(
        `perfil_${usuario.email}`,
        JSON.stringify({ nome, cidade, cpf, avatar })
      );
    }
  }

  function handleAvatar(e) {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = () => setAvatar(reader.result);
      reader.readAsDataURL(file);
    }
  }

  return (
    <div className="p-6 max-w-3xl mx-auto">
      <div className="bg-white rounded-xl shadow-lg p-8 flex flex-col md:flex-row items-center gap-8">
        <div className="flex flex-col items-center">
          <div className="relative">
            <img
              src={avatar || "https://ui-avatars.com/api/?name=" + (nome || "Usuário")}
              alt="Avatar"
              className="w-32 h-32 rounded-full border-4 border-sky-950 object-cover shadow"
            />
            {editando && (
              <label className="absolute bottom-2 right-2 bg-sky-950 text-white rounded-full p-2 cursor-pointer hover:bg-red-500 transition">
                <input type="file" accept="image/*" className="hidden" onChange={handleAvatar} />
                <svg className="w-5 h-5" fill="none" stroke="currentColor" strokeWidth={2} viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" d="M15.232 5.232l3.536 3.536M9 13l6-6m2 2l-6 6m-2 2H7a2 2 0 01-2-2v-2a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2z" />
                </svg>
              </label>
            )}
          </div>
          <p className="mt-4 text-lg font-semibold text-sky-950">{nome || "Seu nome"}</p>
          <p className="text-gray-500">{usuario?.email}</p>
        </div>
        <div className="flex-1 w-full">
          {editando ? (
            <form onSubmit={salvarEdicao} className="space-y-4">
              <input
                className="w-full border border-gray-300 rounded p-2"
                value={nome}
                onChange={(e) => setNome(e.target.value)}
                placeholder="Nome completo"
              />
              <input
                className="w-full border border-gray-300 rounded p-2"
                value={cidade}
                onChange={(e) => setCidade(e.target.value)}
                placeholder="Cidade"
              />
              <input
                className="w-full border border-gray-300 rounded p-2"
                value={cpf}
                onChange={(e) => setCpf(e.target.value)}
                placeholder="CPF"
              />
              <div className="flex gap-2">
                <button type="submit" className="bg-sky-950 text-white px-4 py-2 rounded hover:bg-red-500 transition">
                  Salvar
                </button>
                <button type="button" onClick={() => setEditando(false)} className="bg-gray-200 px-4 py-2 rounded hover:bg-gray-300 transition">
                  Cancelar
                </button>
              </div>
            </form>
          ) : (
            <div className="space-y-2 text-gray-700">
              <p><strong>Nome:</strong> {nome || <span className="text-gray-400">Não informado</span>}</p>
              <p><strong>Email:</strong> {usuario?.email}</p>
              <p><strong>CPF:</strong> {cpf || <span className="text-gray-400">Não informado</span>}</p>
              <p><strong>Cidade:</strong> {cidade || <span className="text-gray-400">Não informado</span>}</p>
              <button
                onClick={() => setEditando(true)}
                className="mt-4 bg-sky-950 text-white px-4 py-2 rounded hover:bg-red-500 transition"
              >
                Editar Dados
              </button>
            </div>
          )}
        </div>
      </div>
      <div className="mt-10 bg-white rounded-xl shadow p-6">
        <h3 className="text-lg font-bold text-sky-950 mb-4">Histórico de Ações</h3>
        <div className="overflow-x-auto">
          <table className="min-w-full text-left">
            <thead>
              <tr>
                <th className="py-2 px-4 border-b">Tipo</th>
                <th className="py-2 px-4 border-b">Descrição</th>
                <th className="py-2 px-4 border-b">Data</th>
              </tr>
            </thead>
            <tbody>
              {historico.length === 0 ? (
                <tr>
                  <td colSpan={3} className="py-4 text-center text-gray-400">Nenhuma ação registrada.</td>
                </tr>
              ) : (
                historico.map((item, i) => (
                  <tr key={i} className="hover:bg-blue-50 transition">
                    <td className="py-2 px-4 border-b">{item.tipo}</td>
                    <td className="py-2 px-4 border-b">{item.desc}</td>
                    <td className="py-2 px-4 border-b">{item.data}</td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default Perfil;