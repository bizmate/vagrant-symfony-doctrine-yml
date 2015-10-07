<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Search
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="AppBundle\Entity\SearchRepository")
 */
class Search
{
    /**
     * @var string
     * @ORM\Id
     * @ORM\Column(name="term", type="string", length=255)
     */
    private $term;

    /**
     * @var integer
     *
     * @ORM\Column(name="val", type="integer")
     */
    private $val;

    /**
     * Set term
     *
     * @param string $term
     * @return Search
     */
    public function setTerm($term)
    {
        $this->term = $term;

        return $this;
    }

    /**
     * Get term
     *
     * @return string 
     */
    public function getTerm()
    {
        return $this->term;
    }

    /**
     * Set val
     *
     * @param integer $val
     * @return Search
     */
    public function setVal($val)
    {
        $this->val = $val;

        return $this;
    }

    /**
     * Get val
     *
     * @return integer 
     */
    public function getVal()
    {
        return $this->val;
    }
}
