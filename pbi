#include "list.h"  //baslık dosyası
#include <cstddef>
#include <new>

List::List(): size(0), head(NULL)
{

}  // yapıcı sonu

List::List(const List& aList)
    : size(aList.size)
{
    if(aList.head == NULL)
        head = NULL;
    else{
        head = new ListNode;
        head->item = aList.head->item;

        ListNode *newPtr = head;

        for(ListNode *origPtr = aList.head->next;
            origPtr != NULL; origPtr = origPtr->next){
                newPtr->next = new ListNode;
                newPtr = newPtr->next;
                newPtr->item = origPtr->item;
            }

        newPtr->next = NULL;
    }

}

List::~List(){
    while (!isEmpty())
        remove(1);
}

bool List::isEmpty() const
{
   return size == 0;
}  // liste sonu
int List::getLength() const
{
   return size;
}  // bitti

List::ListNode *List::find(int index) const// aramak istedgimiz indx yada istenilen index e erişim saglayan operator
{
    if((index < 1) || (index > getLength())){
        return NULL;
}   else{
        ListNode *cur = head;
        for (int skipper = 1; skipper < index; ++skipper){
            cur = cur->next;
            return cur;
        }
}
}
void List::insert(int index, const ListItemType& newItem)
    throw(ListIndexOutOfRangeException, ListException) // istenillmedigi icin eklemedim 
