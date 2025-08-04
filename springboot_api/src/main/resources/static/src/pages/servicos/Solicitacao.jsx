import { useState } from "react";

function Solicitacao() {
  const [tipo, setTipo] = useState("");
  const [descricao, setDescricao] = useState("");
  const [solicitacoes, setSolicitacoes] = useState(
    JSON.parse(localStorage.getItem("solicitacoes")) || []
  );
  const [mensagem, setMensagem] = useState("");

  function registrarSolicitacao(e) {
    e.preventDefault();
    if (!tipo || !descricao) {
      setMensagem("Preencha todos os campos!");
      return;
    }
    const nova = { tipo, descricao, data: new Date().toLocaleString() };
    const novasSolicitacoes = [...solicitacoes, nova];
    setSolicitacoes(novasSolicitacoes);
    localStorage.setItem("solicitacoes", JSON.stringify(novasSolicitacoes));
    setMensagem("Solicitação registrada com sucesso!");
    setTipo("");
    setDescricao("");
  }

  return (
    <div className="p-6 max-w-xl mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-4">Registrar Solicitação de Serviço</h2>
      <form className="space-y-4" onSubmit={registrarSolicitacao}>
        <select
          className="w-full p-2 border rounded"
          value={tipo}
          onChange={(e) => setTipo(e.target.value)}
        >
          <option value="">Selecione o tipo de serviço</option>
          <option value="Iluminação Pública">Iluminação Pública</option>
          <option value="Limpeza Urbana">Limpeza Urbana</option>
          <option value="Buraco na Rua">Buraco na Rua</option>
          <option value="Outro">Outro</option>
        </select>
        <textarea
          className="w-full p-2 border rounded"
          placeholder="Descreva o problema ou solicitação"
          value={descricao}
          onChange={(e) => setDescricao(e.target.value)}
        />
        <button className="w-full bg-sky-950 text-white p-2 rounded">Registrar</button>
        {mensagem && <div className="text-green-600 text-sm">{mensagem}</div>}
      </form>
      <div className="mt-8">
        <h3 className="text-lg font-semibold text-blue-800 mb-2">Minhas Solicitações</h3>
        {solicitacoes.length === 0 && (
          <div className="text-gray-500">Nenhuma solicitação registrada.</div>
        )}
        <ul className="space-y-2">
          {solicitacoes.map((s, i) => (
            <li key={i} className="bg-white rounded shadow p-2">
              <strong>{s.tipo}</strong> - {s.data}
              <div className="text-gray-700">{s.descricao}</div>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}

export default Solicitacao;