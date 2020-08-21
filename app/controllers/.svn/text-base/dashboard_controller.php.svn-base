<?php 

class DashboardController extends LethargicController {
  function index() {
    $newTickets = $this->WorkTicket->find(array('where' => "status = 'unread' AND performedBy = 0", 'order' => 'createdAt DESC', 'limit' => 10));
    $this->smarty->assign('newTickets', $newTickets);

    $assignedTickets = $this->WorkTicket->find(array('where' => "status <> 'done' AND performedBy = " . $_SESSION['user']->id, 'order' => 'updatedAt DESC'));
    $this->smarty->assign('assignedTickets', $assignedTickets);
  }
}

?>