import { Link } from "react-router-dom";

function CardServico({ titulo, descricao, icone, rota }) {
  return (
    <Link to={rota}>
      <div className="bg-white rounded-xl shadow hover:shadow-lg transition p-5 text-center border border-gray-200">
        <div className="text-4xl mb-3 text-sky-950">{icone}</div>
        <h3 className="text-xl font-semibold text-sky-950">{titulo}</h3>
        <p className="text-gray-600 text-sm mt-2">{descricao}</p>
      </div>
    </Link>
  );
}

export default CardServico;
