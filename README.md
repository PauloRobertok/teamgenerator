# TeamDraft 🏐

App iOS nativo em SwiftUI para geração inteligente de times esportivos.

**Tagline:** Balanced Teams, Better Games

---

## Problema
Sorteio manual de times sem balanceamento — times desiguais, mulheres mal distribuídas.

## Solução
App que gera times equilibrados automaticamente respeitando:
- Nível de habilidade de cada jogador (1 a 5)
- Mínimo de mulheres por time configurável
- Grupos fixos salvos (ex: "Vôlei de Terça")

---

## Stack
- iOS 17+
- SwiftUI
- Arquitetura MVVM
- Swift Testing

---

## Status atual
- [x] Projeto criado e configurado
- [x] Estrutura MVVM definida
- [x] Models criados (Player, Group, Team)
- [x] Repositório no GitHub
- [ ] TeamGeneratorService (algoritmo)
- [ ] GroupsView
- [ ] PlayerRosterView
- [ ] GeneratedTeamsView
- [ ] Persistência (UserDefaults ou SwiftData)

---

## Fluxo do app
Splash → Groups → Player Roster → Generated Teams → (Share / Re-roll)

---

## Modelos
- **Player** → nome, gênero, nível (1-5), selecionado
- **Group** → nome, esporte, jogadores, regra de mínimo de mulheres
- **Team** → jogadores, média de nível calculada, contagem de mulheres

---

## Próximo passo
Criar TeamGeneratorService com algoritmo de balanceamento
