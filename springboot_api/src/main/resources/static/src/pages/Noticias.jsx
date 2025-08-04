import { useState, useEffect } from "react";

function Noticias() {
  const [noticias, setNoticias] = useState([]);

  useEffect(() => {
    // Simulação de fetch de notícias
    setTimeout(() => {
      setNoticias([
        {
          id: 1,
          titulo: "Vacinação contra gripe começa hoje",
          resumo: "A campanha de vacinação contra a gripe já está disponível nos postos de saúde.",
        },
        {
          id: 2,
          titulo: "Novo concurso público aberto",
          resumo: "Prefeitura abre vagas para diversas áreas. Inscrições até o fim do mês.",
        },
        {
          id: 3,
          titulo: "Obras de mobilidade urbana",
          resumo: "Novas obras para melhorar o trânsito começam na próxima semana.",
        },
      ]);
    }, 800);
  }, []);

  return (
    <div className="p-6 max-w-3xl mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-6">Notícias</h2>
      <div className="space-y-4">
        {noticias.length === 0 && (
          <div className="text-center text-gray-500">Carregando notícias...</div>
        )}
        {noticias.map((noticia) => (
          <div key={noticia.id} className="bg-white rounded-lg shadow p-4 hover:shadow-lg transition">
            <h3 className="text-lg font-semibold text-sky-950">{noticia.titulo}</h3>
            <p className="text-gray-700">{noticia.resumo}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Noticias;