<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * UserSearch
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="AppBundle\Entity\UserSearchRepository")
 */
class UserSearch
{
    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer")
     * @ORM\Id
     */
    private $userId;

    /**
     * @var string
     *
     * @ORM\Column(name="search_term", type="string", length=255)
     * @ORM\Id
     */
    private $searchTerm;

    /**
     * @var boolean
     *
     * @ORM\Column(name="track", type="boolean")
     */
    private $track;

    /**
     * Set userId
     *
     * @param integer $userId
     * @return UserSearch
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId
     *
     * @return integer 
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set searchTerm
     *
     * @param string $searchTerm
     * @return UserSearch
     */
    public function setSearchTerm($searchTerm)
    {
        $this->searchTerm = $searchTerm;

        return $this;
    }

    /**
     * Get searchTerm
     *
     * @return string 
     */
    public function getSearchTerm()
    {
        return $this->searchTerm;
    }

    /**
     * Set track
     *
     * @param boolean $track
     * @return UserSearch
     */
    public function setTrack($track)
    {
        $this->track = $track;

        return $this;
    }

    /**
     * Get track
     *
     * @return boolean 
     */
    public function getTrack()
    {
        return $this->track;
    }
}
