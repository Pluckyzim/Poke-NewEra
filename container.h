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

#ifndef __CONTAINER__
#define __CONTAINER__
#include "otsystem.h"

#include "cylinder.h"
#include "item.h"

class Depot;
class Container;

class ContainerIterator
{
	public:
		ContainerIterator();
		ContainerIterator(const ContainerIterator& rhs);
		virtual ~ContainerIterator() {}

		ContainerIterator& operator=(const ContainerIterator& rhs);
		bool operator==(const ContainerIterator& rhs);
		bool operator!=(const ContainerIterator& rhs);
		ContainerIterator& operator++();
		ContainerIterator operator++(int32_t);
		Item* operator*();
		Item* operator->();

	protected:
		ContainerIterator(Container* _base);

		Container* base;
		std::queue<Container*> over;
		ItemList::iterator current;

		friend class Container;
};

class Container : public Item, public Cylinder
{
	public:
		Container(uint16_t type);
		Container(uint16_t type, uint16_t size, bool unlocked = true, bool pagination = false);
		Container(Tile* type);
		virtual ~Container();
		virtual Item* clone() const;

		virtual Container* getContainer() {return this;}
		virtual const Container* getContainer() const {return this;}

		virtual Depot* getDepot() {return NULL;}
		virtual const Depot* getDepot() const {return NULL;}

		Attr_ReadValue readAttr(AttrTypes_t attr, PropStream& propStream);
		bool unserializeItemNode(FileLoader& f, NODE node, PropStream& propStream);

		std::string getContentDescription() const;
		uint32_t getItemHoldingCount() const;
		virtual double getWeight() const;
		
		bool isUnlocked() const {
			return unlocked;
		}
		bool hasPagination() const {
			return pagination;
		}

		uint32_t capacity() const {return maxSize;}
		uint32_t size() const {return (uint32_t)itemlist.size();}
		bool full() const {return itemlist.size() >= maxSize;}
		bool empty() const {return itemlist.empty();}

		void addItem(Item* item);
		Item* getItem(uint32_t index);
		Item* getItemByIndex(size_t index) const;
		bool isHoldingItem(const Item* item) const;
		bool isHoldingUniqueItem() const;

		ContainerIterator begin();
		ContainerIterator end();

		ContainerIterator begin() const;
		ContainerIterator end() const;

		ItemList::const_iterator getItems() const {return itemlist.begin();}
		ItemList::const_iterator getEnd() const {return itemlist.end();}

		ItemList::const_reverse_iterator getReversedItems() const {return itemlist.rbegin();}
		ItemList::const_reverse_iterator getReversedEnd() const {return itemlist.rend();}

		//cylinder implementations
		virtual Cylinder* getParent() {return Thing::getParent();}
		virtual const Cylinder* getParent() const {return Thing::getParent();}
		virtual bool isRemoved() const {return Thing::isRemoved();}
		virtual Position getPosition() const {return Thing::getPosition();}
		virtual Tile* getTile() {return Thing::getTile();}
		virtual const Tile* getTile() const {return Thing::getTile();}
		virtual Item* getItem() {return this;}
		virtual const Item* getItem() const {return this;}
		virtual Creature* getCreature() {return NULL;}
		virtual const Creature* getCreature() const {return NULL;}

		virtual ReturnValue __queryAdd(int32_t index, const Thing* thing, uint32_t count,
			uint32_t flags) const;
		virtual ReturnValue __queryMaxCount(int32_t index, const Thing* thing, uint32_t count, uint32_t& maxQueryCount,
			uint32_t flags) const;
		virtual ReturnValue __queryRemove(const Thing* thing, uint32_t count, uint32_t flags) const;
		virtual Cylinder* __queryDestination(int32_t& index, const Thing* thing, Item** destItem,
			uint32_t& flags);

		virtual void __addThing(Creature* actor, Thing* thing);
		virtual void __addThing(Creature* actor, int32_t index, Thing* thing);
		virtual void addItemBack(Item* item);

		virtual void __updateThing(Thing* thing, uint16_t itemId, uint32_t count);
		virtual void __replaceThing(uint32_t index, Thing* thing);

		virtual void __removeThing(Thing* thing, uint32_t count);

		virtual int32_t __getIndexOfThing(const Thing* thing) const;
		virtual Thing* __getThing(uint32_t index) const;

		virtual int32_t __getFirstIndex() const;
		virtual int32_t __getLastIndex() const;

		virtual uint32_t __getItemTypeCount(uint16_t itemId, int32_t subType = -1,
			bool itemCount = true) const;
		virtual std::map<uint32_t, uint32_t>& __getAllItemTypeCount(std::map<uint32_t,
			uint32_t>& countMap, bool itemCount = true) const;

		virtual void postAddNotification(Creature* actor, Thing* thing, const Cylinder* oldParent,
			int32_t index, cylinderlink_t link = LINK_OWNER);
		virtual void postRemoveNotification(Creature* actor, Thing* thing, const Cylinder* newParent,
			int32_t index, bool isCompleteRemoval, cylinderlink_t link = LINK_OWNER);

		virtual void __internalAddThing(Thing* thing);
		virtual void __internalAddThing(uint32_t index, Thing* thing);
		virtual void __startDecaying();

	private:
		void onAddContainerItem(Item* item);
		void onUpdateContainerItem(uint32_t index, Item* oldItem, const ItemType& oldType,
			Item* newItem, const ItemType& newType);
		void onRemoveContainerItem(uint32_t index, Item* item);
		Item* canAutoGroup(const Item* moveItem, int32_t& index) const;

		Container* getParentContainer();
		void updateItemWeight(double diff);
		std::stringstream& getContentDescription(std::stringstream& s) const;

	protected:
		uint32_t maxSize, serializationCount;
		double totalWeight;
		
		bool unlocked;
		bool pagination;

		ItemList itemlist;
		friend class ContainerIterator;
		friend class IOMapSerialize;
};
#endif
