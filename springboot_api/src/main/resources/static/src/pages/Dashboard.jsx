import CardServico from "../components/CardServico";
import { FaUserMd, FaBook, FaBriefcase, FaBus } from "react-icons/fa";

function Dashboard() {
  return (
    <div className="p-6 max-w-6xl mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-6">Central de Serviços</h2>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
        <CardServico
          titulo="Saúde"
          descricao="Agende consultas, veja exames e acesse sua carteirinha do SUS."
          icone={<FaUserMd />}
          rota="/servicos/saude"
        />
        <CardServico
          titulo="Educação"
          descricao="Consulte matrículas, boletins e vagas em creches."
          icone={<FaBook />}
          rota="/servicos/educacao"
        />
        <CardServico
          titulo="Emprego"
          descricao="Acesse vagas, cursos gratuitos e feiras de emprego."
          icone={<FaBriefcase />}
          rota="/servicos/emprego"
        />
        <CardServico
          titulo="Transporte"
          descricao="Veja horários, recarregue o cartão e planeje rotas."
          icone={<FaBus />}
          rota="/servicos/transporte"
        />
        <CardServico
          titulo="Solicitação"
          descricao="Registre solicitações de serviços públicos e acompanhe o status."
          icone={<FaBus />}
          rota="/servicos/solicitacao"
        />
      </div>
    </div>
  );
}

export default Dashboard;
