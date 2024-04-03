////////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
////////////////////////////////////////////////////////////////////////
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
////////////////////////////////////////////////////////////////////////

#ifndef __QUESTS__
#define __QUESTS__
#include "otsystem.h"

#include "networkmessage.h"
#include "player.h"

/*enum QuestStatus_t {
	QUESTSTATUS_UNSTARTED = -1,
	QUESTSTATUS_STARTED = 0,
	QUESTSTATUS_COMPLETED = 1
};*/

typedef std::map<uint32_t, std::string> StateMap;
class Mission
{
	public:
		Mission(std::string _name, std::string _state, uint32_t _storageId, int32_t _startValue, int32_t _endValue, std::string _npcName, uint16_t _level, Outfit_t _npcOutfit, Position _npcPosition)
		{
			name = _name;
			state = _state;
			endValue = _endValue;
			startValue = _startValue;
			storageId = _storageId;
			
			npcName = _npcName;
			level = _level;
			npcOutfit = _npcOutfit;
			npcPosition = _npcPosition;
		}
		virtual ~Mission() {states.clear();}

		void newState(uint32_t id, const std::string& description) {states[id] = description;}

		bool isStarted(Player* player);
		bool isCompleted(Player* player);

		std::string getName(Player* player) {return (isCompleted(player) ? (Localization::t(player->getLanguage(), name) + Localization::t(player->getLanguage(), " (completed)")) : Localization::t(player->getLanguage(), name));}
		std::string getDescription(Player* player);
		std::string getNpcName() {return npcName;}
		
		uint16_t getLevel() {return level;}
		uint32_t getStorageId() {return storageId;}
		
		Outfit_t getNpcOutfit() {return npcOutfit;}
		Position getNpcPosition() {return npcPosition;}
		
		void update(std::string& _npcName, Outfit_t _npcOutfit, Position& _npcPosition, uint16_t _level) {
            npcName = _npcName;
            npcOutfit = _npcOutfit;
            npcPosition = _npcPosition;
            level = _level;
        }

	private:
		std::string name, state, npcName;
		StateMap states;

		int32_t startValue, endValue;
		uint32_t storageId;
		uint16_t level;
		
		Outfit_t npcOutfit;
		Position npcPosition;
};

typedef std::list<Mission*> MissionList;
class Quest
{
	public:
		Quest(std::string _name, uint16_t _id, uint32_t _storageId, int32_t _storageValue, bool _holder)
		{
			name = _name;
			id = _id;
			storageId = _storageId;
			storageValue = _storageValue;
			holder = _holder;
		}
		virtual ~Quest();

		void newMission(Mission* mission) {missions.push_back(mission);}

		bool isStarted(Player* player);
		bool isCompleted(Player* player) const;
		//uint8_t getStatus(Player* player) const;

		uint16_t getId() const {return id;}
		const std::string& getName(Player* player) const {return (player ? Localization::t(player->getLanguage(), name) : name);}
		uint16_t getMissionCount(Player* player);

		inline MissionList::const_iterator getFirstMission() const {return missions.begin();}
		inline MissionList::const_iterator getLastMission() const {return missions.end();}

	private:
		std::string name;
		MissionList missions;

		uint16_t id;
		int32_t storageValue;
		uint32_t storageId;
		
		bool holder;
};

typedef std::list<Quest*> QuestList;
class Quests
{
	public:
		virtual ~Quests() {clear();}
		static Quests* getInstance()
		{
			static Quests instance;
			return &instance;
		}

		void clear();
		bool reload();

		bool loadFromXml();
		bool parseQuestNode(xmlNodePtr p, bool checkDuplicate);

		uint16_t getQuestCount(Player* player);
		uint16_t getQuestCount() { return quests.size(); }

		inline QuestList::const_iterator getFirstQuest() const {return quests.begin();}
		inline QuestList::const_iterator getLastQuest() const {return quests.end();}

		Quest* getQuestById(uint16_t id) const;
		
		void updateQuestMission(uint32_t storageId, std::string& npcName, Outfit_t npcOutfit, Position& npcPosition, uint16_t missionLevel);

	private:
		Quests() {m_lastId = 1;}

		QuestList quests;
		uint16_t m_lastId;
};
#endif
