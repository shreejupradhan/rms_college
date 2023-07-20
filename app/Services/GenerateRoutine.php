<?php

namespace App\Services;
use App\Models\Day;
use App\Models\Student;


class GenerateRoutine 
{
    public function routineGenerate()
    {
        $array = Day::orderBy('day_title')->get()->pluck('id');

        $sortedArray = $this->quickSort($array);
        
          return  Day::whereIn('id',$sortedArray)
                ->with(['routine','routine.course','routine.teacher','routine.teacher.user','routine.room','routine.day','routine.time_slot'])
                ->get();
    }

    public function students()
    {
        return Student::select('*','sections.id as section_id','batch.id as batch_id')
        ->leftJoin('section_students', 'section_students.student_id', '=', 'students.id')
        ->leftJoin('sections', 'sections.id', '=', 'section_students.section_id')
        ->leftJoin('batch', 'students.batch_id', '=', 'batch.id')
        ->leftJoin('shifts', 'shifts.id', '=', 'batch.shift_id')
        ->leftJoin('departments', 'departments.id', '=', 'batch.department_id')
        ->where('batch.is_active','yes')
        ->get();
    }
    

    private function quickSort($array)
    {
        $length = count($array);
        
        // Base case: if the array only has zero or one element, it's already sorted
        if($length <= 1){
            return $array;
        }
        else{
            $pivot = $array[0]; // Select a pivot (in this case, the first element of the array)
            $left = $right = array();
            
            // Partition: Divide the array into two subarrays around the pivot
            for($i = 1; $i < $length; $i++)
            {
                if($array[$i] < $pivot){
                    $left[] = $array[$i];
                }
                else{
                    $right[] = $array[$i];
                }
            }
            
            // Recursively sort the subarrays and combine them with the pivot to get the sorted array
            return array_merge($this->quickSort($left), array($pivot), $this->quickSort($right));
        }
    }
}