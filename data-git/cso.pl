%% different things that a project may have:

%% name, abbrev, abbrevExpansion, oneLineDescription,
%% shortDescription, mediumDescription, longDescription, relatedPaper,
%% relatedPaperTitle, apiDocs, license, url, downloadURL,
%% softwareDownloadURL, datasetDownloadURL,

%% look into CSO tables for all ideas

has(Project,name,Name).
has(Project,apiDocs,APIDocs).
has(Project,license,mit).

%% /var/lib/myfrdcsa/capabilities/argumentation/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/conditional-planning/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/contingent-planning/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/deep-learning/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/dialog-act-recognition/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/general-game-playing/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/grammar-learning/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/grammatical-inference/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/inductive-programming/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/multi-agent-systems/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/multiagent-planning/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/planning/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/program-synthesis/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/capabilities/recognizing-textual-entailment/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/cats/games/prolog-dungeons-and-dragons/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/conformant-aij-20160811/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/des-swi-4.2/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/dprolog-master-20160429/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/fetch-0.7.5/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/fsaplanner-20180605/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/gc-lama-20160810/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/mprolog-2.0/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/oscar-20110807/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/pfc-20180310/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/prodigy-latest-20170221/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/researchcyc-4.0q/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/sgp-20160811/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/umop-1.2/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/external/upshot-montague-20170112/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/architect/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/broker/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/clear/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/cso/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/evangelist/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/formalize/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/gourmet/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/kbfs2/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/myfrdcsa/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/perllib/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/posi/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/radar/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/seeker/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/setanta/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/internal/socbot/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/3t-frdcsa/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/action-extraction/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/agent-attempts/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/api-learner/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/bash-alias-generator/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/broker-buy-sell-system/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/cause-effect/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/cfo/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/clo/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/csa/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/cyc-common/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/cyc-mode/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/data-manager/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/dmiles-systems/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/dnfct-frdcsa/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/document-understanding-system/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/eurisko-resources/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/fact-extraction/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/fe2c/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/free-life-planner/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/free-softbot/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/iaec/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/js-rapid-response/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/kmax-object-manipulation-system/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/mathematical-knowledge-management/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/mission-control/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/nlu/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/package-priority-queue/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/packager-agent/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/politico/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/prevote/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/program-synthesis/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/prolog-agent/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/relationship-manager/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/research-ontology/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/resource-manager/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/skme/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/suppositional-reasoner/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/system-iterator/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/system-recommender/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/universal-parser/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/utility-maximization-system/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/vger/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/what-to-do/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/workhorse/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/codebases/minor/world-state-comparison/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/collections/deep-learning/frdcsa/sys/cso/autoload/system-kb.pl
%% /var/lib/myfrdcsa/datasets/cmu-ai-repository/frdcsa/sys/cso/autoload/system-kb.pl
